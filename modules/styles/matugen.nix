{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   matugen-nix = {
  #     type = "github";
  #     owner = "mois3y";
  #     repo = "matugen-nix";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };

  #   matugen-nix-templates = {
  #     type = "github";
  #     owner = "unazikx";
  #     repo = "matugen-nix-templates";
  #   };
  #   # keep-sorted end
  # };

  zen.styles.matugen = {
    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.matugen-nix.nixosModules.matugen
        ];

        matugen = {
          enable = true;
        };
      };

    homeManagerNixos =
      {
        inputs,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.matugen-nix.homeManagerModules.matugen
          # inputs.matugen-nix-templates.homeModules.default
        ];

        matugen = {
          inherit (osConfig.matugen)
            enable
            mode
            prefer
            wallpaper
            ;
        };
      };
  };
}
