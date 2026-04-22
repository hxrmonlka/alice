{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceStarship = {lib, ...}: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        command_timeout = 1000;
        palette = "alice";

        format = lib.concatStrings [
          "$cmd_duration"
          "[•ᴗ• ](pink)"
          "$character"
        ];

        right_format = lib.concatStrings [
          "[✦ ](pink)"
          "$directory"
          "$git_branch"
          "$git_status"
          "\${custom.venv}"
          "$status"
        ];

        # ── Left ──────────────────────────────────────────────────────────

        cmd_duration = {
          min_time = 500;
          format = "[$duration]($style) ";
          style = "mauve";
        };

        character = {
          success_symbol = "[▶︎](rose)";
          error_symbol = "[▶︎](red)";
          vimcmd_symbol = "[▶︎](gold)";
        };

        # ── Right ────────────────────────────────────────────────────────────

        directory = {
          format = "[$path]($style)";
          style = "gold";
          truncation_length = 3;
          truncate_to_repo = true;
        };

        git_branch = {
          format = "[ $symbol$branch]($style)";
          style = "mauve";
          symbol = "λ ";
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style))";
          style = "mauve";
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
          style = "gold";
          shell = [
            "bash"
            "-c"
          ];
        };

        status = {
          disabled = false;
          success_symbol = "[❤︎](#e28e8c)";
          symbol = "[×](red)";
          format = " $symbol";
        };

        # ── Palette ──────────────────────────────────────────────────────────

        palettes.alice = {
          pink = "#e985b4";
          rose = "#e28e8c";
          gold = "#dbb993";
          mauve = "#cd81a7";
        };

        # ── Disabled ─────────────────────────────────────────────────────────

        username.disabled = true;
        hostname.disabled = true;
        package.disabled = true;
      };
    };
  };
}
