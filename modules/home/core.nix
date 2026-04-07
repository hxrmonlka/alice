{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceCore = { pkgs, ... }: {
    home.username = "alice";
    home.homeDirectory = "/home/alice";
    
    # Matching the stateVersion from your NixOS configuration (25.11)
    home.stateVersion = "25.11";

    # Let Home Manager manage itself
    programs.home-manager.enable = true;
  };
}
