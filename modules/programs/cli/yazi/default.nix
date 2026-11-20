{
  zen,
  ...
}:

{
  zen.programs.cli.yazi = {
    description = ''
      best file manager
      use 'yy' wrapper fot cd in yazi directory
    '';

    includes = [
      zen.programs.cli.yazi.binds
      zen.programs.cli.yazi.icons
      zen.programs.cli.yazi.settings
      zen.programs.cli.yazi.theme
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.yazi;
      in
      {
        programs.yazi = {
          enable = true;

          shellWrapperName = "yy";

          extraPackages = [
            # keep-sorted start
            pkgs.djvulibre
            pkgs.ffmpegthumbnailer
            pkgs.glow
            pkgs.imagemagick
            pkgs.jq
            pkgs.ouch
            pkgs.p7zip-rar
            pkgs.transmission_4
            pkgs.wl-clipboard
            # keep-sorted end
          ];
        };

        stylix.targets.yazi.enable = false;

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
