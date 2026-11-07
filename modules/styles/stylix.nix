{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    # https://tinted-theming.github.io/tinted-gallery
    tinted-schemes = {
      type = "github";
      owner = "tinted-theming";
      repo = "schemes";
      flake = false;
    };
    # keep-sorted end
  };

  zen.styles.stylix = {
    includes = [
      zen.custom.stylix
    ];

    os =
      {
        self',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          enable = true;
          overlays.enable = true;

          images = (
            self'.legacyPackages.images.override {
              colors = colors.toList;
            }
          );
        };
      };

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];
      };

    homeManager =
      {
        self',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          enable = true;
          overlays.enable = true;

          images = self'.legacyPackages.images.override {
            colors = colors.toList;
          };
        };
      };

    homeManagerStandalone =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.homeModules.stylix ];
      };
  };
}
