{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceKitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration.enableZshIntegration = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 13.0;
      };
      settings = {
        "cursor_shape" = "beam";
        confirm_os_window_close = 0;
        shell = "${pkgs.zsh}/bin/zsh";
        cursor_trail = 1;
        background_opacity = 0.81;
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
      };
      extraConfig = ''
        include themes/noctalia.conf
      '';
    };
  };
}
