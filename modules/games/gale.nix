{
  zen,
  ...
}:

{
  zen.games.gale = {
    description = ''
      thunderstore helper
      with launcher to steam
      and pretty ui ye
    '';

    includes = [
      zen.custom.gale
    ];

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.gale;
      in
      {
        programs.gale = {
          enable = true;
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
