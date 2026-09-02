{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiHostConfig = {...}: {
    imports = [
      inputs.lumina.nixosModules.signature
    ];
    networking.hostName = "tanuki";
    system.stateVersion = "26.05";
  };
}
