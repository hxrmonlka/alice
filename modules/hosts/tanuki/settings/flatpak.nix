{...}: {
  flake.custom.tanuki.flatpaks = {inputs, ...}: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      packages = [
        "org.vinegarhq.Sober"
        "com.obsproject.Studio"
        "io.github.shiftey.Desktop"
        "dev.vencord.Vesktop"
      ];
    };
  };
}
