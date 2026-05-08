{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.virtualisation = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      lazydocker
      qemu_kvm
    ];
    programs.virt-manager.enable = true;
    virtualisation = {
      spiceUSBRedirection.enable = true;
      docker.enable = true;
      waydroid.enable = true;
    };
  };
}
