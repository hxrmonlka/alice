{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.zed = {
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
        "c#"
        "dart"
        "swift"
        "python"
      ];
      extraPackages = [pkgs.nil];
      userSettings = {
        lsp = {
          nil = {
            binary = {
              path = lib.getExe pkgs.nil;
            };
          };
        };
        theme = {
          mode = "system";
          dark = "Noctalia Dark Transparent";
          light = "Noctalia Light Transparent";
        };
        languages = {
          Nix = {
            language_servers = ["nil"];
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
    };
  };
}
