{
  zen.custom.suwayomi-server = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.suwayomi-server;
        hocon = pkgs.formats.hocon { };
      in
      {
        options = {
          services.suwayomi-server = {
            enable = lib.mkEnableOption "Suwayomi-Server, a desktop web Mihon";

            package = lib.mkPackageOption pkgs "suwayomi-server" {
              nullable = true;
            };

            settings = lib.mkOption {
              type = hocon.type;
              default = { };
              description = "Suwayomi-Server configuration.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          xdg.dataFile = {
            "Tachidesk/server.conf".source = lib.mkIf (cfg.settings != { }) (
              hocon.generate "suwayomi-server.conf" cfg.settings
            );
          };

          systemd.user.services.suwayomi-server = {
            Unit = {
              Description = cfg.package.meta.description;
              After = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = "${lib.getExe cfg.package}";
              Type = "simple";
              Restart = "on-failure";
            };

            Install.WantedBy = [ "graphical-session.target" ];
          };
        };
      };
  };
}
