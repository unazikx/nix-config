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

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      let
        osCfg = osConfig.programs.appimage;
      in
      {
        xdg.mimeApps = {
          defaultApplicationPackages = osCfg.package |> lib.singleton;
        };
      };
  };
}
