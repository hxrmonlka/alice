{ self
, inputs
, ...
}:
{
  flake.nixosModules.sinEnvironment =
    { pkgs
    , lib
    , ...
    }:
    {
      environment = {
        shells = [
          pkgs.zsh
        ];
      };
    };
}
