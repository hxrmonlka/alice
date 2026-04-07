{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceGitConfig = {pkgs, ...}: {
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
