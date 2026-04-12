{ self, inputs, ... }:
{
  flake.nixosModules.sinFlatpakConfig =
    { ... }:
    {
      services.flatpak = {
        enable = true;
        packages = [
          "com.obsproject.Studio"
          "io.github.shiftey.Desktop"
        ];
        update.onActivation = true;
        uninstallUnmanaged = true;
      };
    };
}
