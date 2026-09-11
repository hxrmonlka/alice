{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.yazi = {
    pkgs,
    lib,
    ...
  }: {
    imports = [inputs.lumina.homeModules.yazi-plugins];

    lumina.yazi.plugins = {
      "dedukun/bookmarks.yazi" = {
        rev = "9ef1254d8afe88aba21cd56a186f4485dd532ab8";
        hash = "sha256-GQFBRB2aQqmmuKZ0BpcCAC4r0JFKqIANZNhUC98SlwY=";
      };
      "KKV9/compress.yazi" = {
        rev = "80e5268ec74c7ac17d4d739e13a9958cba4c70d3";
        hash = "sha256-9cdA8D/TtwHcLqrtoyIixA0YJmTs+c8FSNrjxp8CYI0=";
      };
      "yazi-rs/plugins:chmod" = {
        rev = "58c4f4e2f4835cc9bf6751f39e3f7c574fc7f55a";
        hash = "sha256-kwf9+KXOL5JXGDoEGdtwq+JujP8GVoOwDgz76FBM3xk=";
      };
    };

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
        {
          on = ["c" "m"];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };
}
