{
  ...
}:

{
  zen.programs.cli.appimage = {
    description = ''
      runner for .AppImage packages
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        programs.appimage = {
          enable = true;

          package =
            {
              extraPkgs = _pkgs: [ ];
            }
            |> pkgs.appimage-run.override;
        };
      };

    homeManager =
      {
        ...
      }:
      {
        xdg.mimeApps = {
          defaultApplications = {
            "application/vnd.appimage" = "appimage-run.desktop";
          };
        };
      };
  };
}
