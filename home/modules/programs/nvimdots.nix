{ ... }: {
  programs.neovim.nvimdots = {
    enable = true;
    # setBuildEnv makes mason.nvim and tree-sitter build deps visible to nvim
    # setBuildEnv = true;
  };
}
