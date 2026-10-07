{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: let
    patched = pkgs.extend (_: prev: {
      breakpad = prev.breakpad.overrideAttrs (old: {
        patches =
          (old.patches or [])
          ++ prev.lib.optional
          (!prev.lib.any (p: prev.lib.hasSuffix "fix-vtable-link.patch" (toString p)) (old.patches or []))
          ../../../common/patches/breakpad-fix-vtable-link.patch;
      });
    });
  in {
    packages.konoeNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      pkgs = patched;
      settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
      outOfStoreConfig = "/home/konoe/.config/noctalia";

      user-templates.templates = let
        templates = "${patched.noctalia-shell}/share/noctalia-shell/Assets/Templates";
        themes = "~/.var/app/dev.vencord.Vesktop/config/vesktop/themes";
      in {
        vesktop_flatpak_midnight = {
          input_path = "${templates}/discord-midnight.css";
          output_path = "${themes}/noctalia.theme.css";
        };
        vesktop_flatpak_material = {
          input_path = "${templates}/discord-material.css";
          output_path = "${themes}/noctalia-material.theme.css";
        };
      };
    };
  };
}
