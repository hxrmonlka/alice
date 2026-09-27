{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.inputRemapperPolkit = {pkgs, ...}: {
    # Allow wheel group to run input-remapper without password
    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
