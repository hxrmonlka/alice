{ config, pkgs, lib, ... }:

# Quickshell bar — Kanagawa Wave
# Provides a top bar with:
#   left  : workspace switcher (polls `niri msg --json workspaces`)
#   center: focused window title (polls `niri msg --json focused-window`)
#   right : volume · clock
#
# Requires: quickshell, niri, wpctl (pipewire-pulse), JetBrainsMono Nerd Font
# The noctalia bar must be disabled or placed on a different layer if both are active.

let
  shellQml = ''
    import QtQuick
    import QtQuick.Layouts
    import Quickshell
    import Quickshell.Io
    import Quickshell.Wayland

    // ─── Kanagawa Wave tokens ─────────────────────────────────────────────────
    QtObject {
        id: kw
        readonly property string bg:          "#1f1f28"  // sumiInk1
        readonly property string bgAlt:       "#2a2a37"  // sumiInk2
        readonly property string surface:     "#363646"  // sumiInk3
        readonly property string overlay:     "#54546d"  // sumiInk6
        readonly property string muted:       "#727169"  // fujiGray
        readonly property string subtext:     "#c8c093"  // oldWhite
        readonly property string text:        "#dcd7ba"  // fujiWhite
        readonly property string blue:        "#7e9cd8"  // crystalBlue
        readonly property string violet:      "#957fb8"  // oniViolet
        readonly property string teal:        "#7aa89f"  // waveAqua2
        readonly property string green:       "#98bb6c"  // springGreen
        readonly property string red:         "#c34043"  // autumnRed
        readonly property string yellow:      "#c0a36e"  // boatYellow
        readonly property string pink:        "#d27e99"  // sakuraPink
    }

    // ─── State singletons ─────────────────────────────────────────────────────
    QtObject {
        id: state

        property var workspaces: []
        property string windowTitle: ""
        property int volume: 0
        property bool muted: false
        property string time: Qt.formatDateTime(new Date(), "HH:mm")
        property string date: Qt.formatDateTime(new Date(), "ddd d")
    }

    // ─── Workspace poller ─────────────────────────────────────────────────────
    Process {
        id: wsProc
        command: ["niri", "msg", "--json", "workspaces"]
        running: false
        stdout: StdioCollector { id: wsOut }
        onExited: {
            try {
                var raw = JSON.parse(wsOut.text);
                // Sort by idx, keep id + is_focused + has_windows
                state.workspaces = raw
                    .slice()
                    .sort((a, b) => a.idx - b.idx)
                    .map(w => ({
                        idx:       w.idx,
                        focused:   w.is_focused,
                        hasWin:    w.output !== undefined && w.windows_count > 0
                    }));
            } catch (e) {}
        }
    }

    // ─── Focused window poller ────────────────────────────────────────────────
    Process {
        id: winProc
        command: ["niri", "msg", "--json", "focused-window"]
        running: false
        stdout: StdioCollector { id: winOut }
        onExited: {
            try {
                var w = JSON.parse(winOut.text);
                state.windowTitle = (w && w.title) ? w.title : "";
            } catch (e) {
                state.windowTitle = "";
            }
        }
    }

    // ─── Volume poller ────────────────────────────────────────────────────────
    Process {
        id: volProc
        command: ["sh", "-c",
            "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{v=$2*100; m=($3==\"[MUTED]\"); print int(v) \" \" m}'"]
        running: false
        stdout: StdioCollector { id: volOut }
        onExited: {
            var parts = volOut.text.trim().split(" ");
            if (parts.length >= 1) state.volume  = parseInt(parts[0]) || 0;
            if (parts.length >= 2) state.muted   = parts[1] === "1";
        }
    }

    // ─── Master tick (500 ms) ─────────────────────────────────────────────────
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            if (!wsProc.running)  wsProc.running  = true;
            if (!winProc.running) winProc.running = true;
            if (!volProc.running) volProc.running = true;
            var now = new Date();
            state.time = Qt.formatDateTime(now, "HH:mm");
            state.date = Qt.formatDateTime(now, "ddd d");
        }
    }

    // ─── Bar — one per screen ─────────────────────────────────────────────────
    ShellRoot {
        Variants {
            model: Quickshell.screens

            PanelWindow {
                required property var modelData
                screen: modelData

                // Layer shell placement
                anchors { top: true; left: true; right: true }
                implicitHeight: 32
                margins { left: 6; right: 6; top: 4 }

                // The bar itself
                Rectangle {
                    anchors.fill: parent
                    color: kw.bg
                    radius: 8

                    // Subtle bottom border in overlay colour
                    Rectangle {
                        anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
                        height: 1
                        color: kw.surface
                        opacity: 0.6
                    }

                    RowLayout {
                        anchors { fill: parent; leftMargin: 10; rightMargin: 10 }
                        spacing: 0

                        // ── Left: workspaces ──────────────────────────────────
                        RowLayout {
                            spacing: 4

                            Repeater {
                                model: state.workspaces

                                Rectangle {
                                    required property var modelData
                                    readonly property bool focused: modelData.focused
                                    readonly property bool hasWin:  modelData.hasWin

                                    width:  focused ? 22 : (hasWin ? 8 : 6)
                                    height: focused ? 8  : (hasWin ? 6 : 4)
                                    radius: height / 2

                                    color: focused  ? kw.blue :
                                           hasWin   ? kw.overlay :
                                                      kw.surface

                                    Behavior on width  { SmoothedAnimation { duration: 150 } }
                                    Behavior on height { SmoothedAnimation { duration: 150 } }
                                    Behavior on color  { ColorAnimation    { duration: 150 } }

                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        // ── Center: window title ──────────────────────────────
                        Item {
                            Layout.fillWidth: true

                            Text {
                                anchors.centerIn: parent
                                text: state.windowTitle.length > 64
                                    ? state.windowTitle.substring(0, 61) + "…"
                                    : state.windowTitle
                                color: kw.subtext
                                font.pixelSize: 12
                                font.family: "JetBrainsMono Nerd Font"
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        // ── Right: volume + clock ─────────────────────────────
                        RowLayout {
                            spacing: 12

                            // Volume
                            RowLayout {
                                spacing: 4
                                Text {
                                    text: state.muted ? "󰝟" : (
                                        state.volume >= 66 ? "󰕾" :
                                        state.volume >= 33 ? "󰖀" : "󰕿"
                                    )
                                    color: state.muted ? kw.red : kw.muted
                                    font.pixelSize: 13
                                    font.family: "JetBrainsMono Nerd Font"
                                }
                                Text {
                                    text: state.volume + "%"
                                    color: state.muted ? kw.red : kw.subtext
                                    font.pixelSize: 12
                                    font.family: "JetBrainsMono Nerd Font"
                                }
                            }

                            // Date
                            Text {
                                text: state.date
                                color: kw.muted
                                font.pixelSize: 12
                                font.family: "JetBrainsMono Nerd Font"
                            }

                            // Time  
                            Text {
                                text: state.time
                                color: kw.text
                                font.pixelSize: 13
                                font.weight: Font.Medium
                                font.family: "JetBrainsMono Nerd Font"
                            }
                        }
                    }
                }
            }
        }
    }
  '';
in

{
  home.file.".config/quickshell/shell.qml".text = shellQml;
}
