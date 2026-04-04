{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  programs.neovim.nvimdots = {
    enable = true;
  };

  # How the fuck do I make this look a little better.
  xdg.configFile."nvim/lua".source = lib.mkForce (
    pkgs.runCommand "nvimdots-lua-custom" { } ''
      mkdir -p $out
      cp -r ${inputs.nvimdots}/lua/* $out/
      chmod -R +w $out

      mkdir -p $out/user/configs/lsp-servers

      cat << 'EOF' > $out/user/init.lua
      vim.opt.undofile = true
      EOF

      cat << 'EOF' > $out/user/plugins.lua
      return {
        {
          "mbbill/undotree",
          cmd = "UndotreeToggle",
          keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
          },
        },
      }
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
        -- Call the default setup
        require("lspconfig").nil_ls.setup(opts)
      end
      EOF
    ''
  );
}
