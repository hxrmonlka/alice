{
  self,
  inputs,
  ...
}: {
  flake.nixosModule.tanukiHostConfig = {...}: {
    imports = [];
  };
}
