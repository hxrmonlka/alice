{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.ci = {pkgs, ...}: {
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

    systemd.tmpfiles.rules = [
      "z /var/lib/secrets 0710 root harmonia - -"
      "z /var/lib/secrets/harmonia.pub 0640 root harmonia - -"
    ];

    systemd.services.alice-ci-store-cleanup = {
      description = "Clean Alice CI Nix store";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.nix}/bin/nix-store --gc --store /var/lib/alice-ci";
      };
    };
  };
}
