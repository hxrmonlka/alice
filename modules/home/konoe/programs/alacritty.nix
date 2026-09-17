{
  self,
  inputs,
  ...
}: {
  flake.custom.konoe.alacritty = {
    programs.alacritty = {
      enable = true;
    };
  };
}
