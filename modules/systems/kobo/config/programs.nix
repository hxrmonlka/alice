{
  self,
  input,
  ...
}: {
  flake.custom.kobo.programs = _: {
    programs = {
      lumina-cli.enable = true;
      home-manager.enable = true;
      zen-browser = {
        enable = true;
        setAsDefaultBrowser = true;
      };
    };
  };
}
