{
  ...
}:

{
  zen.miscellaneous.xdg.mime = {
    homeManager =
      {
        ...
      }:
      {
        xdg = {
          mime.enable = true;

          mimeApps = {
            enable = true;
          };

          configFile."mimeapps.list" = {
            force = true;
          };
        };
      };
  };
}
