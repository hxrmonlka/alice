{
  self,
  inputs,
  ...
}: {
  flake.custom.aux-mini.hostConfig = {...}: {
    imports = [
      # inputs
      # none here yet

      # self modules
      self.custom.aux-mini.packages
      self.custom.aux-mini.programs

      # common modules
      self.custom.commonModules.bootSettings
      self.custom.commonModules.fonts
      self.custom.commonModules.bootSettings
      self.custom.commonModules.systemServices

      # hardware settings
      # TODO: get hardware settings and amd requirements
    ];
  };
}
