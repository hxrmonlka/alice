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
      # nvimdots' own nix module (nixos/neovim/default.nix) hardcodes
      # `docformatter` in extraPython3Packages regardless of user settings.
      # docformatter depends on `untokenize`, which is unmaintained (last
      # released 2014) and not compatible with python3.14, breaking the
      # build once nixpkgs bumps the default python3 interpreter.
      # Override it here to drop docformatter while keeping the rest.
      extraPython3Packages = lib.mkForce (ps: with ps; [isort pynvim]);
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
