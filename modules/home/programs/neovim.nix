{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceNeovim = {
    pkgs,
    inputs,
    lib,
    ...
  }: {
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

    xdg.configFile."nvim/lua".source = lib.mkForce (
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
      ''
    );
  };
}
