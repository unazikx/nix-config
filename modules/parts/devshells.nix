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
    };

    nix-wrapper-modules = {
      type = "github";
      owner = "nix-community";
      repo = "nix-wrapper-modules";
    };
    # keep-sorted end
  };

  imports = [
    inputs.devshells.flakeModule
    inputs.nix-wrapper-modules.flakeModules.wrappers
  ];
}
