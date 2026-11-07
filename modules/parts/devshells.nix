{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    devshells = {
      type = "github";
      owner = "numtide";
      repo = "devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wrapper-modules = {
      type = "github";
      owner = "nix-community";
      repo = "nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  imports = [
    inputs.devshells.flakeModule
    inputs.nix-wrapper-modules.flakeModules.wrappers
  ];
}
