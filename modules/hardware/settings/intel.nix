{ self, inputs, ... }:
{
  flake.nixosModules.intelSettings =
    { ... }:
    {
      imports = [
        self.nixosModules.hardwareIntel
      ];
      hardware.alice.intel = {
        gpu = {
          enable = true;
          generation = "legacy";
        };
        cpu.enable = true;
      };
    };
}
