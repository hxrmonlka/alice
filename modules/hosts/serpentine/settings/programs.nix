{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineProgramsConfig = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox;
      };
      mango.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
      dsearch = {
        enable = true;
        package = inputs.danksearch.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      nh = {
        enable = true;
        flake = "/home/alice/alice";
        clean = {
          enable = true;
          dates = "monthly";
          extraArgs = "--keep 5";
        };
      };
      appimage = {
        enable = true;
        binfmt = true;
      };
      thunar = {
        enable = true;
        plugins = with pkgs; [
          xfce.thunar-archive-plugin
          xfce.thunar-media-tags-plugin
          xfce.thunar-vcs-plugin
          thunar-shares-plugin
          xfce.thunar-volman
        ];
      };
    };
  };
}
