{...}: {
  flake.custom.system-modules.kobo-bash = {...}: {
    programs.bash = {
      enable = true;
      bashrcExtra = ''
        export PATH=$HOME/.local/bin:$PATH
        export PS1="[\u@\h \W]\$ "
        export ZED_ALLOW_EMULATED_GPU=1
      '';
      shellAliases = {
        ".." = "cd ..";
        wb = "home-manager switch --flake .#yianyi@kobo";
      };
    };
  };
}
