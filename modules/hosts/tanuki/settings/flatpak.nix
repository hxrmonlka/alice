{...}: {
  flake.custom.tanuki.flatpaks = {inputs, ...}: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
    services.flatpak = {
      enable = true;
      packages = [
        "app.zen_browser.zen"
        "org.vinegarhq.Sober"
        "com.obsproject.Studio"
      ];
    };
  };
}
