{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    artcraft-nix = {
      type = "github";
      owner = "Devitek";
      repo = "artcraft-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.office.artcraft = {
    description = ''
      open-source alternatives for Abobe/MS Office/other
    '';

    homeManagerNixos =
      {
        inputs',
        lib,
        ...
      }:
      {
        home.packages =
          {
            # Adobe Suite
            "Photoshop" = inputs'.artcraft-nix.packages.photocraft;
            "Lightroom" = inputs'.artcraft-nix.packages.lightcraft;
            "AfterEffects" = inputs'.artcraft-nix.packages.effectcraft;
            "PremierePro" = inputs'.artcraft-nix.packages.filmcraft;
            "Illustrator" = inputs'.artcraft-nix.packages.vectorcraft;

            # Microsoft Office
            "Word" = inputs'.artcraft-nix.packages.wordcraft;
            "PowerPoint" = inputs'.artcraft-nix.packages.deckcraft;
            "Excel" = inputs'.artcraft-nix.packages.gridcraft;

            # other
            "CAD" = inputs'.artcraft-nix.packages.cadcraft;
            "Audacity" = inputs'.artcraft-nix.packages.soundcraft;
          }
          |> lib.attrValues;
      };
  };
}
