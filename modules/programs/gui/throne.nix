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
        lib,
        osConfig,
        ...
      }:
      let
        osCfg = osConfig.programs.throne;
      in
      {
        xdg.mimeApps = {
          defaultApplicationPackages = osCfg.package |> lib.singleton;
        };
      };
  };
}
