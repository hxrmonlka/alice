{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.bash = {
    programs = {
      bash = {
        enable = true;
        shellAliases = {
          ll = "ls -alh";
          la = "ls -A";
          l = "ls -CF";
          rebuild = "git add . && nh os switch";
          rebuild-boot = "nh os boot";
        };
      };
    };
  };
}
