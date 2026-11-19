{
  ...
}:

{
  zen.programs.gui.throne = {
    description = ''
      new gen nekoray
      good multi-protocol vpn-client
    '';

    nixos =
      {
        ...
      }:
      {
        programs.throne = {
          enable = true;
          tunMode.enable = true;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        xdg.mimeApps = {
          defaultApplications = {
            "x-scheme-handler/throne" = "throne-url-handler.desktop";
          };
        };
      };
  };
}
