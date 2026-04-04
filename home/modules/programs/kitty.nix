{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "kanagawa";
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11.0;
    };
    settings = {
      "cursor_shape" = "beam";
      confirm_os_window_close = 0;
      font_family = "JetBrainsMono Nerd Font";
      shell = "${pkgs.fish}/bin/fish";
      cursor_trail = 1;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
  };
}
