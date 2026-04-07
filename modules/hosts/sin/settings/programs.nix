{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinProgramsConfig = {...}: {
    programs = {
      firefox.enable = true;
      steam.enable = true;
      nix-ld.enable = true;
      niri.enable = true;
    };
  };
}
