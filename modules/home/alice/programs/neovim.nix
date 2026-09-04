{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.neovim = {
    pkgs,
    inputs,
    lib,
    config,
    ...
  }: let
    nvimLuaCustom =
      pkgs.runCommand "nvimdots-lua-custom" {} ''
        mkdir -p $out
        cp -r ${inputs.nvimdots}/lua/* $out/
        chmod -R +w $out

        mkdir -p $out/user/configs/lsp-servers

        mkdir -p $out/user/plugins

        cat << 'EOF' > $out/user/plugins/undotree.lua
        local plugin = {}

        plugin["mbbill/undotree"] = {
          cmd = "UndotreeToggle",
          keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
          },
        }

        return plugin
        EOF

        cat << 'EOF' > $out/user/plugins/base46.lua
        local plugin = {}

        plugin["AvengeMedia/base46"] = {
          lazy = false,
          priority = 1000,
          config = function()
            require("base46").setup({})
          end,
        }

        return plugin
        EOF

        cat << 'EOF' > $out/user/plugins/notify.lua
        local plugin = {}

        plugin["rcarriga/nvim-notify"] = {
          lazy = true,
          event = "VeryLazy",
          config = function()
            local notify = require("notify")
            local icons = {
              diagnostics = require("modules.utils.icons").get("diagnostics"),
              ui = require("modules.utils.icons").get("ui"),
            }

            require("modules.utils").load_plugin("notify", {
              stages = "fade",
              render = "default",
              fps = 20,
              timeout = 2000,
              minimum_width = 50,
              background_colour = "NormalFloat",
              icons = {
                ERROR = icons.diagnostics.Error,
                WARN = icons.diagnostics.Warning,
                INFO = icons.diagnostics.Information,
                DEBUG = icons.ui.Bug,
                TRACE = icons.ui.Pencil,
              },
              on_open = function(win)
                vim.api.nvim_set_option_value("winblend", 0, { scope = "local", win = win })
                vim.api.nvim_win_set_config(win, { zindex = 90 })
              end,
              level = "INFO",
            })

            vim.notify = notify
          end,
        }

        return plugin
        EOF

        cat << 'EOF' > $out/user/settings.lua
        local settings = {}
        settings["colorscheme"] = "dms"
        settings["lsp_deps"] = {
          "bashls",
          "clangd",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "ruff",
          "nil_ls",
        }
        settings["null_ls_deps"] = {
          "deadnix",
          "statix",
        }
        return settings
        EOF

        cat << 'EOF' > $out/user/configs/lsp-servers/nil_ls.lua
        return function(opts)
          opts.settings = {
            ['nil'] = {
              formatting = {
                command = {"alejandra"},
              },
              nix = {
                flake = {
                  autoEvalInputs = true,
                  autoArchive = true,
                },
              },
            },
          }
          vim.lsp.config("nil_ls", opts)
        end
        EOF

        sed -i \
          's/if status_ok and formatting_supported and client.name == "null-ls" then/if status_ok and formatting_supported and client.name == "null-ls" and vim.bo.filetype ~= "nix" then/' \
          $out/modules/configs/completion/formatting.lua

        sed -i \
          's/handlers = {},/handlers = {\n\t\t\t\talejandra = function() end,\n\t\t\t\tnixfmt = function() end,\n\t\t\t\tnixpkgs_fmt = function() end,\n\t\t\t},/' \
          $out/modules/configs/completion/mason-null-ls.lua
      '';
  in {
    programs.neovim = {
      enable = true;
      withRuby = true;
      nvimdots = {
        enable = true;
      };
      extraPython3Packages = lib.mkForce (
        ps:
          with ps; [
            isort
            pynvim
          ]
      );
    };

    xdg.configFile."nvim/lua".enable = false;

    home.activation.linkNvimLua = lib.hm.dag.entryAfter ["writeBoundary"] ''
      SOURCE_DIR="${nvimLuaCustom}"
      TARGET_DIR="${config.home.homeDirectory}/.config/nvim/lua"

      mkdir -p "$TARGET_DIR"

      for entry in "$SOURCE_DIR"/*; do
        entry_name=$(basename "$entry")
        TARGET="$TARGET_DIR/$entry_name"

        if [ -d "$TARGET" ] && [ ! -L "$TARGET" ]; then
          echo "nvimdots-lua safety lock: $TARGET already exists as a physical directory. Skipping symlink creation."
        else
          rm -f "$TARGET"
          ln -s "$entry" "$TARGET"
        fi
      done

      mkdir -p "$TARGET_DIR/lualine/themes"
    '';
  };
}
