{...}: {
  flake.custom.system-modules.kobo-bash = {...}: {
    programs.bash = {
      enable = true;
      bashrcExtra = ''
        export PATH=$HOME/.local/bin:$PATH
        export PS1="[\u@\h \W]\$ "
      '';
      shellAliases = {
        ".." = "cd ..";
        wb = "home-manager switch --flake .#yianyi@kobo";
      };
    };
  };
}
