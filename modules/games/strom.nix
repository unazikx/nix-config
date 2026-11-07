{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   strom-nix = {
  #     type = "github";
  #     owner = "kraftwerk-gaming";
  #     repo = "strom";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.games.strom = {
    description = ''
      packaged games for nixos
      i dont use this cause not big drive
      searching way to package games to standalone file

      list of available games:
      https://ash.radicle.garden/raw/rad:zaCSBVa8UbKNEWBcmRTW1m9fZXhu/head/web/gui/index.html
    '';

    includes = [
      zen.custom.strom
      zen.services.kubo
    ];

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.strom-nix.nixosModules.ipfs-mirror
          inputs.strom-nix.nixosModules.strom-desktop
        ];

        programs.strom-desktop = {
          enable = true;

          flake = inputs.strom-nix.outPath;
        };

        services.strom-ipfs-mirror = {
          enable = true;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        programs.strom = {
          enable = true;

          games = [
            # inputs'.strom-nix.packages.vintage-story
          ];
        };
      };
  };
}
