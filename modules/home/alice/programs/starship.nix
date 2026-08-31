{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.starship = {lib, ...}: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;

      settings = {
        add_newline = false;
        command_timeout = 1000;
        palette = "alice";

        format = lib.concatStrings [
          "$cmd_duration"
          "[•ᴗ• ](accent)"
          "$character"
        ];

        right_format = lib.concatStrings [
          "[✦ ](accent)"
          "$directory"
          "$git_branch"
          "$git_status"
          "\${custom.venv}"
          "$status"
        ];

        cmd_duration = {
          min_time = 500;
          format = "[$duration]($style) ";
          style = "accent_dim";
        };

        character = {
          success_symbol = "[▶︎](accent)";
          error_symbol = "[▶︎](urgent)";
          vimcmd_symbol = "[▶︎](accent_dim)";
        };

        directory = {
          format = "[$path]($style)";
          style = "accent_dim";
          truncation_length = 3;
          truncate_to_repo = true;
        };

        git_branch = {
          format = "[ $symbol$branch]($style)";
          style = "accent_dim";
          symbol = "λ ";
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style))";
          style = "accent_dim";
          ahead = "↑\${count}";
          behind = "↓\${count}";
          diverged = "↕";
          modified = "~";
          staged = "+";
          untracked = "?";
          deleted = "-";
        };

        custom.venv = {
          command = "echo ♯";
          when = ''[ -n "$VIRTUAL_ENV" ]'';
          format = " [$output]($style)";
          style = "accent";
          shell = [
            "bash"
            "-c"
          ];
        };

        status = {
          disabled = false;
          success_symbol = "[❤︎](accent)";
          symbol = "[×](urgent)";
          format = " $symbol";
        };

        palettes.alice = {
          accent = "#677de4";
          accent_dim = "#4a5fc4";
          urgent = "#fd4663";
        };

        username.disabled = true;
        hostname.disabled = true;
        package.disabled = true;
      };
    };
  };
}
