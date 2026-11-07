{
  self,
  inputs,
  ...
}: {
  flake.custom.ekpyrosis.flatpaks = {...}: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];
    services.flatpak = {
      enable = true;
      packages = [
        "com.obsproject.Studio"
        "io.github.shiftey.Desktop"
        "org.vinegarhq.Sober"
        "net.trowell.kotoba"
        "moe.launcher.sleepy-launcher"
        "md.obsidian.Obsidian"
        "org.localsend.localsend_app"
        "org.kde.krita"
        "org.libreoffice.LibreOffice"
        "io.gitlab.theevilskeleton.Upscaler"
        "org.upscayl.Upscayl"
        "io.mrarm.mcpelauncher"
        "com.danklinux.dankcalendar"
        "org.blender.Blender"
        "org.inkscape.Inkscape"
        "org.kde.kdenlive"
      ];
      update = {
        auto.enable = true;
        auto.onCalendar = "weekly";
      };
    };
  };
}
