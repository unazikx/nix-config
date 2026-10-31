{
  zen,
  ...
}:

{
  zen.services.proxy-suite.tg-ws-proxy = {
    includes = [
      zen.services.proxy-suite.tg-ws-proxy
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

            dcIps = {
              "2" = "149.154.167.220";
              "4" = "149.154.167.220";
            };

            # WARN: generate via
            # nix run nixpkgs#openssl -- rand -hex 16
            secretFile = config.sops.secrets."services/telegram-ws".path;
          };
        };

        sops.secrets = {
          "services/telegram-ws" = { };
        };
      };
  };
}
