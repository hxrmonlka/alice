{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.virtualisation = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      lazydocker
      qemu_full
    ];
    programs.virt-manager.enable = true;
    virtualisation = {
      spiceUSBRedirection.enable = true;
      docker.enable = true;
      waydroid.enable = true;
      libvirtd = {
        enable = true;
        qemu = {
          runAsRoot = false;
        };
      };
    };
  };
}
