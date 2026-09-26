{
  self,
  inputs,
  ...
}: {
  flake.custom.system-modules.arch-linux = _: {
    nixpkgs.config.allowUnfree = true;
  };
}
