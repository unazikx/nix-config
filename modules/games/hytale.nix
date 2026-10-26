{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hytale-nix = {
      type = "github";
      owner = "andreashgk";
      repo = "hytale-nix";
    };
    # keep-sorted end
  };

  zen.games.hytale = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        {
          name = "hytale-seeds-viewer";
          link = "https://hyseeds.ru";
          logo = "https://hyseeds.ru/assets/logo-640.png";
        }
      ];
    };

    homeManagerNixos =
      {
        inputs',
        pkgs,
        ...
      }:
      let
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          inputs'.hytale-nix.packages.hytale-launcher
        ];

        xdg.dataFile = {
          "Hytale/settings.json".source = json.generate "hytale-settings.json" {
            disable_window_controls = true;
            language = "ru";
          };
        };
      };
  };
}
