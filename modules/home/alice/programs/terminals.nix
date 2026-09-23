{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.terminals = {
    pkgs,
    lib,
    ...
  }: {
    programs.ghostty = {
      enable = true;
      installVimSyntax = true;
      installBatSyntax = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = true;

      settings = {
        font-family = "FiraMono Nerd Font";
        font-family-bold = "FiraMono Nerd Font";
        font-family-italic = "FiraMono Nerd Font";
        font-family-bold-italic = "FiraMono Nerd Font";
        font-size = 10;
        background-opacity = 0.85;
        background-blur-radius = 20;
        theme = "dankcolors";

        # Tabs
        keybind = [
          "ctrl+shift+t=unbind"
          "ctrl+shift+w=unbind"
          "ctrl+n=next_tab"
          "ctrl+p=previous_tab"

          # Move between tabs
          "alt+h=previous_tab"
          "alt+l=next_tab"

          # New / close tab
          "ctrl+t=new_tab"
          "ctrl+w=close_tab"

          # Direct tab selection
          "ctrl+1=goto_tab:1"
          "ctrl+2=goto_tab:2"
          "ctrl+3=goto_tab:3"
          "ctrl+4=goto_tab:4"
          "ctrl+5=goto_tab:5"
          "ctrl+6=goto_tab:6"
          "ctrl+7=goto_tab:7"
          "ctrl+8=goto_tab:8"
          "ctrl+9=goto_tab:9"

          # Tab navigation
          "ctrl+n=unbind"
          "ctrl+p=unbind"
          "alt+h=previous_tab"
          "alt+l=next_tab"

          # Tab management
          "alt+shift+n=new_tab"
          "alt+shift+w=close_tab"
        ];
      };
    };

    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 9.0;
      };
      settings = {
        "cursor_shape" = "beam";
        confirm_os_window_close = 0;
        shell = lib.getExe pkgs.zsh;
        cursor_trail = 1;
        background_opacity = 0.81;
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+shift+h" = "previous_tab";
        "ctrl+shift+l" = "next_tab";
      };
      extraConfig = ''
        include dank-theme.conf
        include dank-tabs.conf
      '';
    };
  };
}
