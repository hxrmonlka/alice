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
        "dockerfile"
        "make"
        "latex"
        "lua"
        "csharp"
        "dart"
        "swift"
        "python"
      ];
      extraPackages = [pkgs.nil pkgs.alejandra pkgs.statix pkgs.deadnix pkgs.nixd];
      userSettings = {
        project_panel = {
          dock = "right";
        };
        debugger = {
          dock = "right";
        };
        outline_panel = {
          dock = "right";
        };
        git_panel = {
          dock = "right";
        };
        semantic_tokens = "combined";
        lsp = {
          nil = {
            binary = {
              path = lib.getExe pkgs.nil;
            };
            initialization_options = {
              nix = {
                flake = {
                  autoArchive = true;
                };
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
          shell = {
            program = lib.getExe pkgs.fish;
          };
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
