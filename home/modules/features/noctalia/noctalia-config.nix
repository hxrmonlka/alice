{ config, pkgs, lib, ... }:

# Kanagawa Wave → Material Design color token mapping
# The on-hold branch had Gruvbox colors mislabeled as Kanagawa. Fixed here.
#
# Token    → KW color      → hex
# -------    ----------      ------
# Surface  → sumiInk1      → #1f1f28
# SurfVar  → sumiInk2      → #2a2a37
# OnSurf   → fujiWhite     → #dcd7ba
# OnSurfV  → oldWhite      → #c8c093
# Primary  → crystalBlue   → #7e9cd8
# Secondary→ oniViolet     → #957fb8
# Tertiary → waveAqua2     → #7aa89f
# Error    → autumnRed     → #c34043
# Outline  → sumiInk6      → #54546d
# Shadow   → sumiInk0      → #16161d
# Hover    → springBlue    → #7fb4ca

{
  home.file.".config/noctalia/config.json".text = builtins.toJSON {
    colors = {
      mError             = "#c34043"; # autumnRed
      mHover             = "#7fb4ca"; # springBlue
      mOnError           = "#dcd7ba"; # fujiWhite
      mOnHover           = "#1f1f28"; # sumiInk1
      mOnPrimary         = "#1f1f28"; # sumiInk1
      mOnSecondary       = "#1f1f28"; # sumiInk1
      mOnSurface         = "#dcd7ba"; # fujiWhite
      mOnSurfaceVariant  = "#c8c093"; # oldWhite
      mOnTertiary        = "#1f1f28"; # sumiInk1
      mOutline           = "#54546d"; # sumiInk6
      mPrimary           = "#7e9cd8"; # crystalBlue
      mSecondary         = "#957fb8"; # oniViolet
      mShadow            = "#16161d"; # sumiInk0
      mSurface           = "#1f1f28"; # sumiInk1
      mSurfaceVariant    = "#2a2a37"; # sumiInk2
      mTertiary          = "#7aa89f"; # waveAqua2
    };
    settings = {
      appLauncher = {
        customLaunchPrefix         = "";
        customLaunchPrefixEnabled  = false;
        enableClipPreview          = true;
        enableClipboardHistory     = true;
        iconMode                   = "tabler";
        pinnedExecs                = [];
        position                   = "center";
        showCategories             = true;
        sortByMostUsed             = true;
        terminalCommand            = "kitty -e";
        useApp2Unit                = false;
        viewMode                   = "list";
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
        capsuleOpacity  = 0.92;
        density         = "comfortable";
        exclusive       = true;
        floating        = true;   # floating pill bar
        marginHorizontal = 0.4;
        marginVertical   = 0.4;
        monitors        = [];
        outerCorners    = true;
        position        = "top";  # was "left" — top suits niri's horizontal scroll
        showCapsule     = true;
        showOutline     = false;
        transparent     = false;
        widgets = {
          left   = [ "launcher" "workspaces" ];
          center = [ "windowTitle" ];
          right  = [ "mpris" "volume" "network" "battery" "clock" "notifications" ];
        };
      };
      notifications = {
        position  = "top-right";
        maxVisible = 5;
      };
    };
  };
}
