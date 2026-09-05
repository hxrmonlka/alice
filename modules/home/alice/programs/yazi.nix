{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.yazi = {pkgs, ...}: {
    imports = [inputs.lumina.homeModules.yazi-plugin-manager];

    lumina.yazi.plugins = [
      "KKV9/compress"
      "dedukun/bookmarks"
    ];

    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
      settings.theme.flavor.use = "noctalia";
      keymap.mgr.prepend_keymap = [
        # compress.yazi -> ya pkg add KKV9/compress
        {
          on = ["c" "a" "a"];
          run = "plugin compress";
          desc = "Archive selected files";
        }
        {
          on = ["c" "a" "p"];
          run = "plugin compress -p";
          desc = "Archive selected files (password)";
        }
        {
          on = ["c" "a" "h"];
          run = "plugin compress -ph";
          desc = "Archive selected files (password+header)";
        }
        {
          on = ["c" "a" "l"];
          run = "plugin compress -l";
          desc = "Archive selected files (compression level)";
        }
        {
          on = ["c" "a" "u"];
          run = "plugin compress -phl";
          desc = "Archive selected files (password+header+level)";
        }
        # bookmarks.yazi -> ya pkg add dedukun/bookmarks
        {
          on = ["m"];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = ["'"];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = ["b" "d"];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = ["b" "D"];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmarks";
        }
      ];
    };
  };
}
