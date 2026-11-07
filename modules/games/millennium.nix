{
  zen,
  ...
}:

{
  zen.games.millennium = {
    description = ''
      custom css injector and extensions for steam
    '';

    includes = [
      zen.games.steam
    ];

    nixos =
      {
        ...
      }:
      { };
  };
}
