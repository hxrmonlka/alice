{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.bootOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.custom.commonModules.bootSettings];
    boot.kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-latest";
    boot.loader.grub.theme = "${inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.grub-theme}/grub/themes/tela";
    boot.plymouth.enable = true;
    boot.consoleLogLevel = 3;
    boot.initrd.verbose = false;
    boot.kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
