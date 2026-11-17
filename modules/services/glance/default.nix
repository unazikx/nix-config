{
  zen,
  ...
}:

{
  zen.services.glance = {
    description = ''
      best dashboard
      fr, i use it everyday

      ...нет напиздел, еще делаю
    '';

    includes = [
      zen.services.glance.settings
    ];

    nixos =
      {
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.glance;
      in
      {
        services.glance = {
          enable = true;
          openFirewall = true;

          environmentFile = config.security.nix-secrets.secrets."services-glance".path;
        };

        security.nix-secrets.secrets = {
          "services-glance" = { };
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "${host.hostName}.local"
              "glance.${host.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.settings.server.host}:${toString cfg.settings.server.port}
              '';
            });
      };
  };
}
