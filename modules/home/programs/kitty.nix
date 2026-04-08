{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceKitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      themeFile = "mellow";
      enableGitIntegration = true;
      shellIntegration.enableZshIntegration = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11.0;
      };
      settings = {
        "cursor_shape" = "beam";
        confirm_os_window_close = 0;
        font_family = "JetBrainsMono Nerd Font";
        shell = "${pkgs.zsh}/bin/zsh";
        cursor_trail = 1;
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
      };
    };
  };
}
