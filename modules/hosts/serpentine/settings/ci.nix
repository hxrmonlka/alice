{
  self,
  inputs,
  pkgs,
  ...
}: {
  flake.custom.serpentine.ci = {...}: {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "alice-ci-store-cleanup" ''
        exec ${pkgs.systemd}/bin/systemctl start alice-ci-store-cleanup.service
      '')
    ];

    security.sudo.extraRules = [
      {
        users = ["github-runner-serpentine"];
        commands = [
          {
            command = "/run/current-system/sw/bin/alice-ci-store-cleanup";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];

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
  };
}
