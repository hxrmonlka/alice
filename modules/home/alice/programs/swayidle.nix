{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.swayidle = {
    lib,
    pkgs,
    ...
  }: {
    services.swayidle = let
      system = pkgs.stdenv.hostPlatform.system;
      lock = "qs ipc call lock activate";
      mmsg = "${inputs.mangowc.packages.${system}.mango}/bin/mmsg";
    in {
      enable = true;
      package = pkgs.swayidle;

      systemdTargets = ["mango-session.target"];

      timeouts = [
        {
          timeout = 900;
          command = lock;
        }
        {
          timeout = 1200;
          command = "${mmsg} dispatch sleep_monitor";
          resumeCommand = "${mmsg} dispatch wakeup_monitor";
        }
      ];
    };
  };
}
