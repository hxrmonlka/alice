{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.zathura = {pkgs, ...}: {
    home.packages = with pkgs; [
      zathuraPkgs.zathura_pdf_poppler
    ];
    programs.zathura = {
      enable = true;
    };
  };
}
