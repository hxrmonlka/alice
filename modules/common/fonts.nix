{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.fonts = {pkgs, ...}: {
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
      pkgs.nerd-fonts._0xproto
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
      noto-fonts-emoji-blob-bin
    ];
  };
}
