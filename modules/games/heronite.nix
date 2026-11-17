{
  zen,
  ...
}:

{
  zen.games.heronite = {
    description = ''
      best 3rd party client for games
    '';

    includes = [
      zen.custom.heronite
      zen.games.heroic
      zen.games.steam
    ];

    homeManagerNixos =
      {
        self',
        ...
      }:
      {
        programs.heronite = {
          enable = true;

          package = self'.packages.heronite;
        };
      };
  };
}
