{
  ...
}:

{
  zen.services.vaultwarden = {
    description = ''
      completly anonymous password manager

      keyguard (android)
      rbw (linux)
      bitwarden addons (firefox)
    '';

    os =
      {
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.vaultwarden;
      in
      {
        services.vaultwarden = {
          enable = true;

          backupDir = "/var/backup/vaultwarden";

          config = {
            rocketAddress = "0.0.0.0";
            rocketPort = 8311;

            signupsAllowed = true;
            invitationsAllowed = false;
            webVaultEnabled = true;

            dataFolder = "/var/lib/vaultwarden" |> lib.mkDefault;
          };

          environmentFile = config.security.nix-secrets.secrets."services-vaultwarden".path;
        };

        systemd.services.vaultwarden.serviceConfig = {
          StateDirectory = cfg.config.dataFolder |> baseNameOf |> lib.mkForce;
        };

        networking.firewall.allowedTCPPorts = [ cfg.config.rocketPort ];

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "vaultwarden.${host.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.config.rocketAddress}:${toString cfg.config.rocketPort}
              '';
            });

        security.nix-secrets.secrets = {
          "services-vaultwarden" = { };
        };

        security.nix-secrets.secrets."services-vaultwarden" = {
          # waiting for rezlization security.nix-secrets
          #
          # reloadUnits = [ "vaultwarden.service" ];
        };
      };
  };
}
