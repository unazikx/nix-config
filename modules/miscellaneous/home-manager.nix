{
  self,
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.miscellaneous.home-manager = {
    os =
      {
        ...
      }:
      {
        home-manager.extraSpecialArgs = {
          inherit
            self
            inputs
            ;
        };
      };
  };
}
