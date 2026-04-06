import QtQuick
import AliceNoctaliaDesign 1.0

// Visual layer for a left, floating bar: rounded shell, soft shadow stack,
// vertical wash + slow sheen. Bind tint* to qs.Services.UI Color.* when forked into Noctalia.
Item {
    id: root

    property color tintPrimary: FaithfulPalette.primary
    property color tintSecondary: FaithfulPalette.secondary
    property color surfaceTop: Qt.alpha(FaithfulPalette.surfaceRaised, 0.94)
    property color surfaceBottom: Qt.alpha(FaithfulPalette.surfaceDeep, 0.92)

    property real cornerRadius: 18
    property real sheenDurationMs: 5200
    property real breatheDurationMs: 4800

    implicitWidth: 48
    implicitHeight: 400

    // Soft shadow stack (no QtQuick.Effects dependency)
    Repeater {
        model: 3
        delegate: Rectangle {
            readonly property real spread: (index + 1) * 3
            anchors.fill: body
            anchors.margins: -spread - 2
            radius: root.cornerRadius + spread
            color: Qt.alpha("#000000", 0.07 - index * 0.015)
            z: -3 + index
        }
    }

    Rectangle {
        id: body
        anchors.fill: parent
        radius: root.cornerRadius
        border.width: 1
        border.color: Qt.alpha(tintPrimary, 0.38)
        clip: true

        gradient: Gradient {
            GradientStop {
                position: 0
                color: surfaceTop
            }
            GradientStop {
                position: 1
                color: surfaceBottom
            }
        }

        // Accent edge strip — animates opacity for a gentle “alive” bar without distracting motion
        Rectangle {
            id: edgeGlow
            width: 3
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            radius: root.cornerRadius
            color: tintPrimary
            opacity: 0.35

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation {
                    to: 0.65
                    duration: root.breatheDurationMs / 2
                    easing.type: Easing.InOutSine
                }
                NumberAnimation {
                    to: 0.28
                    duration: root.breatheDurationMs / 2
                    easing.type: Easing.InOutSine
                }
            }
        }

        // Horizontal sheen band (moves upward for a vertical bar)
        Rectangle {
            id: sheen
            width: parent.width * 0.72
            height: parent.height * 0.22
            radius: height / 2
            x: (parent.width - width) / 2
            y: -height
            rotation: 0
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: Qt.alpha(tintSecondary, 0)
                }
                GradientStop {
                    position: 0.5
                    color: Qt.alpha(tintSecondary, 0.14)
                }
                GradientStop {
                    position: 1
                    color: Qt.alpha(tintSecondary, 0)
                }
            }

            SequentialAnimation on y {
                loops: Animation.Infinite
                PauseAnimation {
                    duration: 400
                }
                NumberAnimation {
                    from: -sheen.height
                    to: root.height + sheen.height
                    duration: root.sheenDurationMs
                    easing.type: Easing.InOutQuad
                }
            }
        }

        // Subtle radial bloom tied to primary (shifts when wallpaper-driven colors update)
        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 1.9
            height: parent.height * 0.45
            radius: width / 2
            color: tintPrimary
            opacity: 0.06

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation {
                    to: 0.11
                    duration: root.breatheDurationMs / 2
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    to: 0.05
                    duration: root.breatheDurationMs / 2
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
