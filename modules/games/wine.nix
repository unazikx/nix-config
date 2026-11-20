{
  ...
}:

{
  zen.games.wine = {
    description = ''
      wine and winetricks
    '';

    homeManager =
      {
        pkgs,
        lib,
        ...
      }:
      let
        winePackage = pkgs.wineWow64Packages;
      in
      {
        home.packages = [
          pkgs.winetricks
          winePackage.fonts
          winePackage.staging
        ];

        xdg.mimeApps = {
          defaultApplicationPackages = winePackage.staging |> lib.singleton;
        };
      };
  };
}
