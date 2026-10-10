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
    boot = {
      loader.timeout = 0;
      kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-latest";
      loader.grub.theme = "${inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.grub-theme}/grub/themes/tela";
      plymouth.enable = true;
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
