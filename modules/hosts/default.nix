{
  self,
  inputs,
  ...
}: {
  imports = [inputs.easy-hosts.flakeModule];

  easy-hosts.hosts = {
    serpentine.modules = [self.nixosModules.serpentineHostConfig];
    tanuki.modules = [self.nixosModules.tanukiHostConfig];
  };
}
