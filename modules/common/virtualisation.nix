{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.virtualisation = {pkgs, ...}: {
    imports = [inputs.lumina.nixosModules.waydroid];

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
      };

      spiceUSBRedirection.enable = true;
      docker.enable = true;
    };

    lumina.waydroid = {
      enable = true;
      houdini.enable = true;
    };
  };
}
