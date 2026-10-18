{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
    };
    # keep-sorted end
  };

  zen.games.steam-config = {
    description = ''
      config options:
      https://github.com/different-name/steam-config-nix/blob/master/options.md
    '';

    includes = [
      zen.games.steam-config.config-files
      zen.games.steam-config.non-steam-games
      zen.games.steam-config.steam-games
    ];

    wiki = {
      "Steam".links = [
        {
          name = "steam-config-nix";
          link = "https://github.com/different-name/steam-config-nix/blob/master/options.md";
          logo = "https://avatars.githubusercontent.com/u/49257026";
        }
      ];
    };

    homeManagerNixos =
      {
        self',
        inputs,
        ...
      }:
      {
        imports = [
          inputs.steam-config-nix.homeModules.steam-config-nix
        ];

        programs.steam.config = {
          enable = true;
          onSteamRunning = "close";
          # ^^^ close Steam and apply the changes, waiting for any running games to exit first

          defaultCompatTool = self'.packages.proton-ge;

          displayRatesAsBits = false;
          notifications = true;
        };
      };
  };
}
