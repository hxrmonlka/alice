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
      lock = "${lib.getExe inputs.dms.packages.${system}.dms-shell} ipc call lock lock";
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
