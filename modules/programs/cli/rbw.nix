{
  ...
}:

{
  zen.programs.cli.rbw = {
    description = ''
      bitwarden cli client
    '';

    nixos =
      {
        self',
        ...
      }:
      {
        environment.systemPackages = [
          self'.packages.rbw-fork
        ];
      };

    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      {
        programs.rbw = {
          enable = true;

          package = self'.packages.rbw-fork;
        };

        home.packages = [
          pkgs.pinentry-curses
        ];

        dbus.packages = [
          pkgs.gcr_3
        ];

        security.nix-secrets.secrets = {
          "programs-rbw-email" = { };
          "programs-rbw-url" = { };
        };

        security.nix-secrets.templates = {
          "rbw-config" = {
            path = "${config.xdg.configHome}/rbw/config.json";
            content = lib.toJSON {
              email = config.security.nix-secrets.secrets."programs-rbw-email";
              base_url = config.security.nix-secrets.secrets."programs-rbw-url";
              lock_timeout = 60 * 30;
              sync_interval = 4;

              # fork specified
              auto_unlock = true;
              lock_on_idle = false;
              lock_on_sleep = false;
              saved_password = "systemd-creds";
              system_auth = true;

              # https://github.com/unnamed-systems/nix-secrets/issues/38
              # pinentry = lib.getExe pkgs.pinentry-curses;
            };
          };
        };
      };
  };
}
