{ config, pkgs, lib, ... }:

{
  # Noctalia Shell configuration
  # Note: Since we don't have the full wrapper infrastructure, we'll provide the config
  # and assume the user will use the noctalia-shell package.
  
  home.file.".config/noctalia/config.json".text = builtins.toJSON {
    colors = {
      mError = "#fb4934";
      mHover = "#83a598";
      mOnError = "#282828";
      mOnHover = "#282828";
      mOnPrimary = "#282828";
      mOnSecondary = "#282828";
      mOnSurface = "#fbf1c7";
      mOnSurfaceVariant = "#ebdbb2";
      mOnTertiary = "#282828";
      mOutline = "#57514e";
      mPrimary = "#b8bb26";
      mSecondary = "#fabd2f";
      mShadow = "#282828";
      mSurface = "#282828";
      mSurfaceVariant = "#3c3836";
      mTertiary = "#83a598";
    };
    settings = {
      appLauncher = {
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipPreview = true;
        enableClipboardHistory = false;
        iconMode = "tabler";
        pinnedExecs = [];
        position = "center";
        showCategories = true;
        sortByMostUsed = true;
        terminalCommand = "kitty -e";
        useApp2Unit = false;
        viewMode = "list";
      };
      audio = {
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        mprisBlacklist = [];
        preferredPlayer = "";
        visualizerType = "linear";
        volumeOverflow = false;
        volumeStep = 5;
      };
      bar = {
        capsuleOpacity = 1;
        density = "comfortable";
        exclusive = true;
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        monitors = [];
        outerCorners = true;
        position = "left";
        showCapsule = false;
        showOutline = false;
        transparent = false;
        widgets = {
          center = [];
          left = [ "launcher" "workspaces" "windowTitle" ];
          right = [ "mpris" "volume" "network" "battery" "clock" "notifications" ];
        };
      };
    };
  };
}
