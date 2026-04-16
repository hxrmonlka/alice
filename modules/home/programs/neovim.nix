{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceNeovim =
    {
      pkgs,
      inputs,
      lib,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        withRuby = true;
        nvimdots = {
          enable = true;
        };
      };

      xdg.configFile."nvim/lua".source = lib.mkForce (
        pkgs.runCommand "nvimdots-lua-custom" { } ''
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

          cat << 'EOF' > $out/user/settings.lua
          local settings = {}
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
        ''
      );
    };
}
