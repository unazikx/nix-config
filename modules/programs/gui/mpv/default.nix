{
  zen,
  ...
}:

{
  zen.programs.gui.mpv = {
    description = ''
      best video player

      by default anime4k is enabled
    '';

    includes = [
      zen.programs.gui.mpv.anime4k
      zen.programs.gui.mpv.bindings
      zen.programs.gui.mpv.scripts
      zen.programs.gui.mpv.settings
      zen.programs.gui.mpv.theme
    ];

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.mpv;
      in
      {
        programs.mpv.enable = true;

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };

        stylix.targets = {
          mpv.enable = false;
        };
      };
  };
}
