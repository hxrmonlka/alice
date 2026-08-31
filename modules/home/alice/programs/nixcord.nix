{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.nixcord = {
    programs.nixcord = {
      enable = true;
      discord.vencord.enable = false;
      discord.equicord.enable = true;

      config = {
        frameless = true;
        useQuickCss = true;
        enabledThemes = ["noctalia.theme.css"];
        plugins = {
          crashHandler.enable = true;
          betterBlockedUsers.enable = true;
          alwaysAnimate.enable = true;
          autoDndWhilePlaying.enable = true;
          blurNsfw.enable = true;
          clearUrls.enable = true;
          dragify.enable = true;
          fileUpload.enable = true;
          gitHubRepos.enable = true;
          googleThat.enable = true;
          newPluginsManager.enable = true;
          silentTyping.enable = true;
          fakeNitro.enable = true;
          commandPalette.enable = true;
          copyFileContents.enable = true;
          contentWarning.enable = true;
          noF1.enable = true;
          streamerModeOnStream.enable = true;
          typingTweaks = {
            enable = true;
            amITyping = true;
            showAvatars = true;
          };
          voiceRejoin.enable = true;
          whosWatching.enable = true;
          youtubeAdblock.enable = true;
        };
      };
    };
  };
}
