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
        ...
      }:
      let
        package = pkgs.inkscape.override {
          inkscapeExtensions = [
            pkgs.inkscape-extensions.textext
            pkgs.inkscape-extensions.silhouette
          ];
        };
      in
      {
        home.packages = package |> lib.singleton;

        xdg.mimeApps = {
          defaultApplicationPackages = package |> lib.singleton;
        };
      };
  };
}
