{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.programs = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox;
      };
      tmux = {
        enable = true;
        keyMode = "vi";
        clock24 = true;
        baseIndex = 0;
        extraConfig = ''
          set -g default-shell ${lib.getExe pkgs.nushell}
          unbind C-b
          set -g prefix C-s
          bind C-s send-prefix
          bind h select-pane -L
          bind j select-pane -D
          bind k select-pane -U
          bind l select-pane -R

          bind H resize-pane -L 5
          bind J resize-pane -D 5
          bind K resize-pane -U 5
          bind L resize-pane -R 5
        '';
      };
      mango.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
      dsearch = {
        enable = true;
        package = inputs.danksearch.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      nh = {
        enable = true;
        flake = "/home/alice/alice";
        clean = {
          enable = true;
          dates = "monthly";
          extraArgs = "--keep 5";
        };
      };
      appimage = {
        enable = true;
        binfmt = true;
      };
      thunar = {
        enable = true;
        plugins = with pkgs; [
          thunar-archive-plugin
          thunar-media-tags-plugin
          thunar-vcs-plugin
          thunar-shares-plugin
          thunar-volman
        ];
      };
    };
  };
}
