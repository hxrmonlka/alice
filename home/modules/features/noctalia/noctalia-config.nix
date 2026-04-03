# Prerequisites:
#   flake.nix inputs: noctalia.url = "github:noctalia-dev/noctalia-shell";
#   In your HM sharedModules or home.nix imports:
#     inputs.noctalia.homeModules.default
#
# The old home.file approach wrote to config.json which noctalia ignores.
# settings.json is a read-only symlink managed by the HM module — don't touch it directly.

{ config, pkgs, lib, inputs, ... }:

# Kanagawa Wave → Noctalia Material 3 token mapping
# mSurface        → sumiInk1  #1f1f28
# mSurfaceVariant → sumiInk2  #2a2a37
# mOnSurface      → fujiWhite #dcd7ba
# mOnSurfaceVariant→ oldWhite #c8c093
# mPrimary        → crystalBlue #7e9cd8
# mSecondary      → oniViolet  #957fb8
# mTertiary       → waveAqua2  #7aa89f
# mError          → autumnRed  #c34043
# mOutline        → sumiInk6   #54546d
# mShadow         → sumiInk0   #16161d

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      colors = {
        mError            = "#c34043"; # autumnRed
        mHover            = "#7fb4ca"; # springBlue
        mOnError          = "#dcd7ba"; # fujiWhite
        mOnHover          = "#1f1f28"; # sumiInk1
        mOnPrimary        = "#1f1f28"; # sumiInk1
        mOnSecondary      = "#1f1f28"; # sumiInk1
        mOnSurface        = "#dcd7ba"; # fujiWhite
        mOnSurfaceVariant = "#c8c093"; # oldWhite
        mOnTertiary       = "#1f1f28"; # sumiInk1
        mOutline          = "#54546d"; # sumiInk6
        mPrimary          = "#7e9cd8"; # crystalBlue
        mSecondary        = "#957fb8"; # oniViolet
        mShadow           = "#16161d"; # sumiInk0
        mSurface          = "#1f1f28"; # sumiInk1
        mSurfaceVariant   = "#2a2a37"; # sumiInk2
        mTertiary         = "#7aa89f"; # waveAqua2
      };

      settings = {
        appLauncher = {
          customLaunchPrefix        = "";
          customLaunchPrefixEnabled = false;
          enableClipPreview         = true;
          enableClipboardHistory    = true;
          iconMode                  = "tabler";
          pinnedExecs               = [];
          position                  = "center";
          showCategories            = true;
          sortByMostUsed            = true;
          terminalCommand           = "kitty -e";
          useApp2Unit               = false;
          viewMode                  = "list";
        };

        audio = {
          cavaFrameRate   = 60;
          externalMixer   = "pwvucontrol || pavucontrol";
          mprisBlacklist  = [];
          preferredPlayer = "";
          visualizerType  = "linear";
          volumeOverflow  = false;
          volumeStep      = 5;
        };

        bar = {
          capsuleOpacity   = 0.92;
          density          = "comfortable";
          exclusive        = true;
          floating         = true;
          marginHorizontal = 0.4;
          marginVertical   = 0.4;
          monitors         = [];
          outerCorners     = true;
          position         = "top";
          showCapsule      = true;
          showOutline      = false;
          transparent      = false;
          widgets = {
            left   = [ "launcher" "workspaces" ];
            center = [ "windowTitle" ];
            right  = [ "mpris" "volume" "network" "battery" "clock" "notifications" ];
          };
        };

        notifications = {
          position   = "top-right";
          maxVisible = 5;
        };
      };
    };
  };
}
