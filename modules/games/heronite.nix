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
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.heronite;
      in
      {
        programs.heronite = {
          enable = true;

          package = self'.packages.heronite;
        };

        xdg.dataFile = {
          "heronite/tools/proton/GE-Proton-Patched" = {
            recursive = true;
            source = self'.packages.proton-ge.steamcompattool;
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
