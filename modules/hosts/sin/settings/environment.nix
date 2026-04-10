{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.sinEnvironment =
    {
      pkgs,
      lib,
      ...
    }:
    {
      environment = {
        etc."xdg/autostart/ibus-autostart.desktop" = lib.mkForce {
          text = ''
            [Desktop Entry]
            Hidden=true
          '';
        };
        shells = [
          pkgs.zsh
        ];
      };
    };
}
