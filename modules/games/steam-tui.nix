{
  zen,
  ...
}:

{
  zen.games.steam-tui = {
    description = ''
      feature rich tui steam client
      build on cachix
    '';

    includes = [
      zen.custom.steam-tui
    ];

    homeManagerNixos =
      {
        self',
        config,
        ...
      }:
      {
        programs.steam-tui = {
          enable = true;
          package = self'.packages.steam-tui;

          settings."" = {
            sort = "last";
            reverse = true;
            "filter" = "installed";
            show_offline = true;
          };
        };

        security.nix-secrets.secrets = {
          "programs/steam-tui" = {
            path = "${config.xdg.configHome}/steam-tui/account";
          };
        };
      };
  };
}
