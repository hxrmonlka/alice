{
  self,
  inputs,
  ...
}: {
  imports = [inputs.easy-hosts.flakeModule];

  easy-hosts.hosts = {
    ekpyrosis.modules = [self.custom.ekpyrosis.hostConfig];
    tanuki.modules = [self.custom.tanuki.hostConfig];
  };
}
