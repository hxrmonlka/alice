{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.serpentineFlatpakConfig =
    { ... }:
    {
      services.flatpak = {
        enable = true;
        packages = [
          "com.obsproject.Studio"
          "io.github.shiftey.Desktop"
          "app.zen_browser.zen"
          "org.vinegarhq.Sober"
        ];
        update.onActivation = true;
      };
    };
}
