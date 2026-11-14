{
  ...
}:

{
  zen.programs.cli.rbw = {
    description = ''
      bitwarden cli client
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        programs.rbw = {
          enable = true;
        };

        dbus.packages = [ pkgs.gcr_3 ];

        sops.secrets = {
          "programs/rbw/email" = { };
          "programs/rbw/url" = { };
        };

        sops.templates = {
          "rbw-config" = {
            path = "${config.xdg.configHome}/rbw/config.json";
            content = lib.toJSON {
              email = config.sops.placeholder."programs/rbw/email";
              base_url = config.sops.placeholder."programs/rbw/url";
              lock_timeout = 60 * 30;
              sync_interval = 4;
              pinentry = pkgs.pinentry-curses;
            };
          };
        };
      };
  };
}
