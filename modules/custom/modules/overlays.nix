{
  zen.custom.overlays = {
    root-system =
      {
        lib,
        ...
      }:
      {
        options = {
          overlayPkgs = lib.mkOption {
            type = lib.types.listOf lib.types.anything;
            default = [ ];
            description = "A list with overlays for flake-parts pkgs.";
          };
        };
      };
  };
}
