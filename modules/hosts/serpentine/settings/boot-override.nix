{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.bootOverride = {
    pkgs,
    lib,
    ...
  }: let
    logo = "${pkgs.nixos-icons}/share/icons/hicolor/256x256/apps/nix-snowflake-white.png";
  in {
    imports = [
      self.custom.commonModules.bootSettings
      inputs.lumina.nixosModules.plymouth-spinner-centered
    ];
    lumina.plymouth.spinnerCentered = {
      enable = true;
      inherit logo;
    };
    boot = {
      loader.timeout = 3;
      kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-latest";
      loader.grub.theme = "${inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.grub-theme}/grub/themes/tela";
      loader.grub.timeoutStyle = "hidden";
      consoleLogLevel = 3;
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
