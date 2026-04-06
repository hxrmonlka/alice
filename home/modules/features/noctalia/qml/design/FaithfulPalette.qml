pragma Singleton

import QtQuick

// Faithful (Noctalia built-in) — four swatches from wallpaper-derived defaults.
// Reference ~/.config/noctalia/colors.json (Home Manager) for runtime Material roles.
QtObject {
    readonly property color rose: "#e985b4"
    readonly property color coral: "#e28e8c"
    readonly property color sand: "#dbb993"
    readonly property color mauve: "#cd81a7"

    readonly property color primary: rose
    readonly property color secondary: mauve
    readonly property color tertiary: coral
    readonly property color accentOnDark: sand

    readonly property color surfaceDeep: "#151018"
    readonly property color surfaceRaised: "#221a26"
    readonly property color onSurface: "#f4eaf0"
    readonly property color onSurfaceMuted: sand
}
