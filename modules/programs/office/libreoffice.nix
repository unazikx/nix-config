{
  ...
}:

{
  zen.programs.office.inkscape = {
    description = ''
      alternative for Abobe Illustrator
      vector graphic
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.libreoffice;
      in
      {
        programs.libreoffice = {
          enable = true;
          package = pkgs.libreoffice-stable;
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
