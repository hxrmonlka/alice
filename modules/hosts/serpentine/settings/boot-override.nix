{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.bootOverride = {
    config,
    pkgs,
    lib,
    ...
  }: let
    logo = "${pkgs.nixos-icons}/share/icons/hicolor/256x256/apps/nix-snowflake-white.png";
    spinnerCentered = pkgs.runCommand "plymouth-theme-spinner-centered" {} ''
      d=$out/share/plymouth/themes/spinner-centered
      src=${config.boot.plymouth.package}/share/plymouth/themes/spinner
      mkdir -p $d
      cp $src/*.png $d/
      rm -f $d/watermark.png
      cp ${logo} $d/watermark.png
      sed \
        -e "s,^Name=.*,Name=Spinner Centered," \
        -e "s,^ImageDir=.*,ImageDir=$d," \
        -e "/^\(Watermark\)\?\(Horizontal\|Vertical\)Alignment=/d" \
        -e "/^\[two-step\]/a HorizontalAlignment=.5\nVerticalAlignment=.75\nWatermarkHorizontalAlignment=.5\nWatermarkVerticalAlignment=.5" \
        $src/spinner.plymouth > $d/spinner-centered.plymouth
    '';
  in {
    imports = [self.custom.commonModules.bootSettings];
    boot = {
      loader.timeout = 0;
      kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-latest";
      loader.grub.theme = "${inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.grub-theme}/grub/themes/tela";
      plymouth = {
        enable = true;
        theme = "spinner-centered";
        themePackages = [spinnerCentered];
        inherit logo;
      };
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
