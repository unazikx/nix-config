{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  imports = [
    inputs.disko.flakeModules.default
  ];

  zen.miscellaneous.disko = {
    description = ''
      declarative disk partitioning and formatting
      using nix
      formats disk entire

      for Windows:
      1. run disko
      2. install nixos (remains 120gb~ for windows)
      3. install windows itself in remain partion size
    '';

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.disko.nixosModules.disko
        ];
      };
  };
}
