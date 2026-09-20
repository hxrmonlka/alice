{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.ci = {...}: {
    services.github-runners.serpentine = {
      enable = true;
      name = "serpentine";
      url = "https://github.com/hxrmonlka/alice-ci";
      tokenFile = "/var/lib/secrets/github-runner-serpentine";
      tokenType = "registration";
      replace = true;

      extraLabels = [
        "serpentine"
        "nix"
      ];

      serviceOverrides = {
        SupplementaryGroups = [
          "harmonia"
        ];
      };
    };

    services.harmonia.cache = {
      enable = true;
      signKeyPaths = [
        "/var/lib/secrets/harmonia.secret"
      ];
    };

    security.sudo.extraRules = [
      {
        users = ["github-runner-serpentine"];
        commands = [
          {
            command = "${inputs.nixpkgs.legacyPackages.x86_64-linux.systemd}/bin/systemctl start alice-ci-store-cleanup.service";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
