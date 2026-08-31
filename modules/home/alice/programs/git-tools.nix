{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.gitTools = {pkgs, ...}: {
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
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    home.packages = with pkgs; [
      lazygit
    ];
  };
}
