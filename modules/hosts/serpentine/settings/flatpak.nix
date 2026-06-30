{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineFlatpakConfig = {...}: {
    services.flatpak = {
      enable = true;
      packages = [
        "com.obsproject.Studio"
        "io.github.shiftey.Desktop"
        "app.zen_browser.zen"
        "org.vinegarhq.Sober"
        "net.trowell.kotoba"
        "moe.launcher.sleepy-launcher"
        "md.obsidian.Obsidian"
        "org.localsend.localsend_app"
      ];
      update.onActivation = true;
    };
  };
}
