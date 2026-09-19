{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.zed = {
    pkgs,
    lib,
    ...
  }: {
    programs.zed-editor = {
      enable = true;
      enableMcpIntegration = true;
      extensions = [
        "nix"
        "rust"
        "toml"
        "html"
        "ruby"
        "vue"
        "dockerfile"
        "make"
        "latex"
        "lua"
        "csharp"
        "dart"
        "swift"
        "python"
      ];
      extraPackages = [pkgs.nil pkgs.alejandra pkgs.statix pkgs.deadnix];
      userSettings = {
        semantic_tokens = "combined";
        lsp = {
          nil = {
            binary = {
              path = lib.getExe pkgs.nil;
            };
            settings = {
              flake = {
                autoArchive = true;
              };
            };
          };
        };
        theme = {
          mode = "system";
          dark = "DankShell Dark Transparent";
          light = "DankShell Light Transparent";
        };
        languages = {
          Nix = {
            language_servers = ["nil"];
            formatter = {
              external = {
                command = lib.getExe pkgs.alejandra;
                arguments = ["--quiet" "--"];
              };
            };
            format_on_save = "on";
          };
        };
        relative_line_numbers = true;
        terminal = {
          font_family = "0xProto Nerd Font Mono";
          shell = "system";
        };
        telemetry = {
          metrics = false;
          diagnostics = false;
        };
        vim_mode = true;
        buffer_font_size = 15;
        ui_font_size = 16;
      };
      userTasks = [
        {
          label = "Nix: Statix Check (File)";
          command = lib.getExe pkgs.statix;
          args = ["check" "$ZED_FILE"];
        }
        {
          label = "Nix: Statix Fix (File)";
          command = lib.getExe pkgs.statix;
          args = ["fix" "$ZED_FILE"];
        }
        {
          label = "Nix: Deadnix Check (File)";
          command = lib.getExe pkgs.deadnix;
          args = ["$ZED_FILE"];
        }
        {
          label = "Nix: Deadnix Fix (File)";
          command = lib.getExe pkgs.deadnix;
          args = ["--edit" "$ZED_FILE"];
        }
      ];
    };
  };
}
