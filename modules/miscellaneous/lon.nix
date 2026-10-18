{
  ...
}:

{
  zen.miscellaneous.lon = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment = {
          systemPackages = [
            pkgs.lon
          ];

          variables = {
            LON_DIRECTORY = ".lon";
          };
        };
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home = {
          packages = [
            pkgs.lon
          ];

          sessionVariables = {
            LON_DIRECTORY = ".lon";
          };
        };
      };
  };
}
