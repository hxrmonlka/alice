{ config, pkgs, lib, ... }:

{
  # wlr-which-key configuration
  # We'll provide the config as a YAML file in the standard location.
  
  home.file.".config/wlr-which-key/config.yaml".text = ''
    font: "JetBrainsMono Nerd Font 12"
    background: "#242424"
    color: "#ebdbb2"
    border: "#7daea3"
    separator: " ➜ "
    border_width: 2
    corner_r: 15
    padding: 15
    rows_per_column: 5
    column_padding: 25
    anchor: "bottom-right"
    margin_right: 0
    margin_bottom: 5
    margin_left: 5
    margin_top: 0
    menu:
      - key: "b"
        name: "Bluetooth"
        cmd: "noctalia-shell ipc call bluetooth togglePanel"
      - key: "w"
        name: "WiFi"
        cmd: "noctalia-shell ipc call wifi togglePanel"
      - key: "f"
        name: "Firefox"
        cmd: "firefox"
      - key: "t"
        name: "Telegram"
        cmd: "telegram-desktop"
      - key: "d"
        name: "Discord"
        cmd: "vesktop"
      - key: "m"
        name: "Youtube Music"
        cmd: "pear-desktop"
      - key: "s"
        name: "Pavucontrol"
        cmd: "pavucontrol"
  '';
}
