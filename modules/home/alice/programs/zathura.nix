{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.zathura = {pkgs, ...}: {
    home.packages = with pkgs; [
      zathuraPkgs.zathura_pdf_poppler
    ];
    programs.zathura = {
      enable = true;
    };
  };
}
