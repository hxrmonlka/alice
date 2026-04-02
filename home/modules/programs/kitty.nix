{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    themeFile = "kanagawa";
    enableGitIntegration = true;
    enableFishIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11.0
    };
    settings = {
      cursor_shape = beam;
      cursor_trail = 100;
      confirm_os_window_close = 0;
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      shell = fish;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
  };
}
