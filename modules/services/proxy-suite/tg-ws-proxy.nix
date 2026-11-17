{
  zen,
  ...
}:

{
  zen.services.proxy-suite.tg-ws-proxy = {
    includes = [
      zen.services.proxy-suite
    ];

    nixos =
      {
        config,
        ...
      }:
      {
        services.proxy-suite = {
          tgWsProxy = {
            # INFO:
            # connect via this link
            # https://t.me/proxy?server=127.0.0.1&port=1443&secret=dda95d4572bdc10eebaa57192dd9384095
            enable = true;

            listener = {
              address = "127.0.0.1";
              port = 1443;
            };

            # dcIps = {
            #   "2" = "149.154.167.220";
            #   "4" = "149.154.167.220";
            # };

            # WARN: generate via
            # nix run nixpkgs#openssl -- rand -hex 16
            # or
            # nix-secrets regenerate "services-telegramws"
            secretFile = config.security.nix-secrets.secrets."services-telegramws".path;
          };
        };

        security.nix-secrets.secrets = {
          "services-telegramws" = {
            generator.openssl = {
              numbers = 16;
            };
          };
        };
      };
  };
}
