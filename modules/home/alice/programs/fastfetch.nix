{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.fastfetchConfig = {
    pkgs,
    lib,
    ...
  }: {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "small";
          # source = "/path/to/picture.jpeg";
        };
        modules = [
          "break"
          {
            type = "custom";
            format = "\[90m┌──────────────────────Hardware──────────────────────┐";
          }
          {
            type = "custom";
            format = "Nobo";
            key = " PC";
            keyColor = "green";
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
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "bios";
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "│ ├󰏖";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "└ └";
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
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "wm";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "│ ├󰉼";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = "└ └";
            keyColor = "blue";
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
