{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.kitty = {
    pkgs,
    lib,
    ...
  }: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 9.0;
      };
      settings = {
        "cursor_shape" = "beam";
        confirm_os_window_close = 0;
        shell = lib.getExe pkgs.nushell;
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
