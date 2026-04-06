{ config, pkgs, lib, inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  # Reference QML (Faithful palette singleton + left-bar ambience). Preview with:
  # QML2_IMPORT_PATH="$HOME/.config/noctalia/design" qml BarLeftFloatingAmbience.qml
  xdg.configFile = {
    "noctalia/design/qmldir".source = ./qml/design/qmldir;
    "noctalia/design/FaithfulPalette.qml".source = ./qml/design/FaithfulPalette.qml;
    "noctalia/design/BarLeftFloatingAmbience.qml".source = ./qml/design/BarLeftFloatingAmbience.qml;
  };

  programs.noctalia-shell = {
    enable = true;

    # Faithful swatches: #e985b4 #e28e8c #dbb993 #cd81a7 — aligned with BarLeftFloatingAmbience defaults.
    colors = {
      mError = "#e85d6a";
      mHover = "#d77aab";
      mOnError = "#f4eaf0";
      mOnHover = "#151018";
      mOnPrimary = "#151018";
      mOnSecondary = "#151018";
      mOnSurface = "#f4eaf0";
      mOnSurfaceVariant = "#dbb993";
      mOnTertiary = "#151018";
      mOutline = "#5c4a62";
      mPrimary = "#e985b4";
      mSecondary = "#cd81a7";
      mShadow = "#0a080c";
      mSurface = "#151018";
      mSurfaceVariant = "#221a26";
      mTertiary = "#e28e8c";
    };

    settings = {
      appLauncher = {
        customLaunchPrefix = "";
        customLaunchPrefixEnabled = false;
        enableClipPreview = true;
        enableClipboardHistory = true;
        iconMode = "tabler";
        pinnedApps = [ ];
        position = "center";
        showCategories = true;
        sortByMostUsed = true;
        terminalCommand = "kitty -e";
        viewMode = "list";
      };

      audio = {
        mprisBlacklist = [ ];
        preferredPlayer = "";
        spectrumFrameRate = 60;
        visualizerType = "linear";
        volumeOverdrive = false;
        volumeStep = 5;
      };

      bar = {
        barType = "floating";
        capsuleOpacity = 0.92;
        density = "comfortable";
        marginHorizontal = 12;
        marginVertical = 12;
        monitors = [ ];
        outerCorners = true;
        position = "left";
        showCapsule = true;
        showOutline = true;
        transparent = false;
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Workspace"; }
          ];
          center = [ { id = "ActiveWindow"; } ];
          right = [
            { id = "MediaMini"; }
            { id = "Volume"; }
            { id = "Network"; }
            { id = "Battery"; }
            { id = "Clock"; }
            { id = "NotificationHistory"; }
          ];
        };
      };

      colorSchemes = {
        darkMode = true;
        generationMethod = "tonal-spot";
        monitorForColors = "";
        predefinedScheme = "Noctalia (default)";
        schedulingMode = "off";
        syncGsettings = true;
        useWallpaperColors = true;
      };

      notifications = {
        location = "top_right";
      };
    };
  };
}
