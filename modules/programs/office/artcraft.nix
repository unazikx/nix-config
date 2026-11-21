{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    artcraft-flake = {
      type = "github";
      owner = "hy4ri";
      repo = "artcraft-flake";
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
      let
        artcraft-programs =
          {
            # Adobe Suite
            "Photoshop" = inputs'.artcraft-flake.packages.photocraft;
            "Lightroom" = inputs'.artcraft-flake.packages.lightcraft;
            "AfterEffects" = inputs'.artcraft-flake.packages.effectcraft;
            "PremierePro" = inputs'.artcraft-flake.packages.filmcraft;
            "Illustrator" = inputs'.artcraft-flake.packages.vectorcraft;

            # Microsoft Office
            "Word" = inputs'.artcraft-flake.packages.wordcraft;
            "PowerPoint" = inputs'.artcraft-flake.packages.deckcraft;
            "Excel" = inputs'.artcraft-flake.packages.gridcraft;
            "PDF" = inputs'.artcraft-flake.packages.pdfcraft;

            # other
            # "CAD" = inputs'.artcraft-flake.packages.cadcraft;
            "Audacity" = inputs'.artcraft-flake.packages.soundcraft;
          }
          |> lib.attrValues;
      in
      {
        home.packages = artcraft-programs;

        xdg.mimeApps = {
          defaultApplicationPackages = artcraft-programs;
        };
      };
  };
}
