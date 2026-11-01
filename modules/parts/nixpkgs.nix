{
  inputs,
  ...
}:

{
  # flake-file.tack = {
  #   allFollow = {
  #     nixpkgs-unstable = [
  #       "nixpkgs"
  #       "nixpkgs-lib"
  #     ];
  #   };
  # };

  flake-file.inputs = {
    nixpkgs.follows = "nixpkgs-unstable";

    # keep-sorted start block=yes newline_separated=yes
    nixpkgs-master = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "master";
    };

    nixpkgs-stable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-26.05";
    };

    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    # keep-sorted end
  };

  zen.flake-system.default = {
    overlays =
      {
        ...
      }:
      {
        nixpkgs-branches = (
          _final: _prev:
          let
            build = rev: import rev _final._branch-config;
          in
          {
            _master = build inputs.nixpkgs-master;
            _stable = build inputs.nixpkgs-stable;
            _unstable = build inputs.nixpkgs-unstable;

            _branch-config = {
              inherit (_final)
                system
                ;
              config = {
                inherit (_prev.config)
                  allowBroken
                  allowInsecure
                  allowUnfree
                  ;
              };
            };
          }
        );
      };
  };
}
