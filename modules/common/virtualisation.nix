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
      OVMFFull
    ];

    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.ovmf.enable = true;
      };

      spiceUSBRedirection.enable = true;
      docker.enable = true;
      waydroid.enable = true;
    };
  };
}
