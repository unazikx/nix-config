{
  zen,
  ...
}:

{
  zen.programs.gui.foliate = {
    description = ''
      just read books from various sources
    '';

    includes = [
      zen.custom.foliate
    ];

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.foliate;
      in
      {
        programs.foliate = {
          enable = true;

          catalogs = [
            # keep-sorted start block=yes
            {
              title = "Flibusta";
              uri = "http://flibusta.is/opds";
            }
            {
              title = "Internet Archive";
              uri = "https://bookserver.archive.org/catalog";
            }
            {
              title = "Samlib";
              uri = "http://opdshome.uo1.net/samlib";
            }
            # keep-sorted end
          ];
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
