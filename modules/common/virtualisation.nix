{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.virtualisation = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      lazydocker
      qemu_kvm
      androidenv.androidPkgs.platform-tools
      scrcpy
    ];

    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd = {
        enable = true;
      };

      spiceUSBRedirection.enable = true;
      docker.enable = true;
      waydroid.enable = true;
    };
  };
}
