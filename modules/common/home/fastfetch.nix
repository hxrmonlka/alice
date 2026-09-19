{
  self,
  inputs,
  ...
}: {
  flake.custom.home-common.fastfetchConfig = {
    pkgs,
    lib,
    config,
    osConfig,
    ...
  }: {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "${inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.fastfetch-source}/fastfetch-source.jpg";
          width = 40;
          height = 18;
        };
        modules = let
          esc = builtins.fromJSON ''"\u001b"'';
        in [
          "break"
          {
            type = "custom";
            format = "\[90m┌──────────────────────Hardware──────────────────────┐";
          }
          {
            type = "custom";
            format = "Alice — ${osConfig.networking.hostName}";
            key = " PC";
            keyColor = "green";
          }
          {
            type = "opengl";
            key = "│ ├󰾲";
            keyColor = "green";
          }
          {
            type = "vulkan";
            key = "│ └󰢮";
            keyColor = "green";
          }
          {
            type = "wifi";
            key = "│ └󰤥";
            keyColor = "green";
            format = "({signal-quality}%)";
          }
          {
            type = "custom";
            format = "\[90m└────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "custom";
            format = "\[90m┌──────────────────────Software──────────────────────┐";
          }
          {
            type = "os";
            key = " OS";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "bios";
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "│ ├󰏖";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "└ └";
            keyColor = "yellow";
          }
          "break"
          {
            type = "de";
            key = " DE";
            keyColor = "blue";
          }
          {
            type = "lm";
            key = "│ ├󰍂";
            keyColor = "blue";
          }
          {
            type = "wm";
            key = "│ ├󰕮";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "│ ├󰉼";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "custom";
            format = "${esc}]8;;https://github.com/hxrmonlka/alice${esc}\\github:hxrmonlka/alice${esc}]8;;${esc}\\";
            key = "└ └";
            keyColor = "";
          }
          {
            type = "custom";
            format = "\[90m└────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "custom";
            format = "\[90m┌─────────────────Uptime / Age / DT──────────────────┐";
          }
          {
            type = "command";
            key = "  OS Age ";
            keyColor = "magenta";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          }
          {
            type = "uptime";
            key = "  Uptime ";
            keyColor = "magenta";
          }
          {
            type = "datetime";
            key = "  DateTime ";
            keyColor = "magenta";
          }
          {
            type = "custom";
            format = "\[90m└────────────────────────────────────────────────────┘";
          }
          {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
          }
        ];
      };
    };
  };
}
