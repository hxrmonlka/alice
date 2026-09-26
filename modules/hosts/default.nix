{
  self,
  inputs,
  ...
}: {
  imports = [inputs.easy-hosts.flakeModule];

  easy-hosts.hosts = {
    serpentine.modules = [self.custom.serpentine.hostConfig];
    tanuki.modules = [self.custom.tanuki.hostConfig];
  };
}
