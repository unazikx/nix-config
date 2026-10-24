{
  zen,
  ...
}:

{
  zen.services.proxy-suite.warp = {
    includes = [
      zen.services.proxy-suite
      zen.services.proxy-suite.proxy
    ];

    nixos =
      {
        self,
        lib,
        config,
        host,
        ...
      }:
      {
        services.proxy-suite = {
          amneziaWg = {
            enable = true;

            profiles = {
              warp-one = {
                configFile = config.sops.secrets."warp-one".path;
              };
            };
          };

          warp = {
            enable = true;
            asAmneziaWg = true;
          };
        };

        sops.secrets =
          [
            "warp-one"
          ]
          |> (
            list:
            lib.genAttrs list (name: {
              sopsFile = "${self}/secrets/${host.hostName}/${name}.conf";
              format = "binary";
            })
          );
      };
  };
}
