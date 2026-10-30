{
  self,
  inputs,
  ...
}: let
  fontPackages = pkgs: with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    liberation_ttf
    dejavu_fonts
    roboto-flex
    ipafont
    ipaexfont
    noto-fonts-cjk-serif
    twemoji-color-font
    unifont
    noto-fonts-emoji-blob-bin
  ];
in {
  flake.custom.commonModules.fonts = {pkgs, ...}: {
    fonts.fontDir.enable = true;
    fonts.packages = fontPackages pkgs;
  };

  flake.custom.home-common.fonts = {pkgs, ...}: {
    home.packages = fontPackages pkgs;
    fonts.fontconfig.enable = true;
  };
}
