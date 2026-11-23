{
  zen,
  ...
}:

{
  zen.hardware.mounting = {
    description = ''
      tools for seamless drives mounting
      default to /media/drive-name
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        services = {
          gvfs.enable = true;

          udisks2 = {
            enable = true;

            mountOnMedia = true;
          };
        };

        systemd.user.services = {
          gvfs-daemon.path = [ pkgs.wsdd ];
        };
      };

    homeManager =
      {
        lib,
        user,
        ...
      }:
      {
        services.udiskie = {
          enable = true;

          settings = {
            program_options = {
              tray = true;
              menu = "flat";
              notify = true;
              file_manager = lib.mkIf (user.hasAspect zen.programs.gui.nemo) "nemo";
            };
          };
        };
      };
  };
}
