{
  self,
  inputs,
  ...
}: {
  flake.custom.system-modules.zsh = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      zsh = {
        enable = true;
        autocd = true;
        shellAliases = {
          la = "ls -la";
          gg = "lazygit";
        };
        initContent = lib.mkOrder 1200 ''
          pre time!
        '';
      };
    };
  };
}
