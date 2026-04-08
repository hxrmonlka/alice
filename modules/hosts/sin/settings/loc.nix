{ self
, inputs
, ...
}:
{
  flake.nixosModules.sinLocales =
    { pkgs, ... }:
    {
      time.timeZone = "Asia/Manila";
      # Whenever I switch countries.
      # time.timeZone = "Asia/Tokyo";

      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };

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
