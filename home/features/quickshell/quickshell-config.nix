{ config, pkgs, lib, ... }:

{
  # Quickshell configuration
  # We'll provide the config as a QML file in the standard location.
  
  home.file.".config/quickshell/shell.qml".text = ''
    import QtQuick 2.15
    import Quickshell 1.0
    import Quickshell.Wayland 1.0

    Shell {
        // Vimjoyer's Quickshell config is usually more complex and split into modules.
        // We'll provide a basic shell.qml that can be extended.
        
        Panel {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 30
            
            Rectangle {
                anchors.fill: parent
                color: "#242424"
                
                Text {
                    anchors.centerIn: parent
                    text: "Quickshell Panel"
                    color: "#ebdbb2"
                    font.pixelSize: 14
                }
            }
        }
    }
  '';
}
