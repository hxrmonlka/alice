{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.btop = {pkgs, ...}: {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "noctalia";
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
