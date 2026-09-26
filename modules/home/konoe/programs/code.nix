{
  self,
  inputs,
  ...
}: {
  flake.custom.konoe.code = {pkgs, ...}: {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = true;
    };
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    programs.git = {
      enable = true;
      settings = {
        url = {
          "https://github.com/" = {
            insteadOf = "git@github.com:";
          };
        };
      };
    };
  };
}
