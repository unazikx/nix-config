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
        ...
      }:
      {
        home.packages = [
          (pkgs.inkscape.override {
            inkscapeExtensions = [
              pkgs.inkscape-extensions.textext
              pkgs.inkscape-extensions.silhouette
            ];
          })
        ];

        xdg.mimeApps = {
          defaultApplications = {
            "image/svg+xml" = "org.inkscape.Inkscape.desktop";
            "image/svg+xml-compressed" = "org.inkscape.Inkscape.desktop";
          };
        };
      };
  };
}
