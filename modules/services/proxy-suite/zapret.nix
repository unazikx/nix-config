{
  zen,
  ...
}:

{
  zen.services.proxy-suite = {
    meta = {
      excludeDomains = [ ];

      domains = [
        "modrinth.com"
        "anilist.co"
        "app.mangoreader.org"
        "web.nyora.xyz"
        "wotaku.wiki"
      ];
    };

    zapret-discord-youtube = {
      includes = [
        zen.services.proxy-suite
      ];

      nixos =
        {
          config,
          ...
        }:
        let
          meta = zen.services.proxy-suite.meta;
        in
        {
          services.proxy-suite.zapret = {
            enable = true;
            engine = "zapret-discord-youtube";

            zapret-discord-youtube = {
              configName = "general (ALT12)";
              gameFilter = if config.programs.steam.enable then "all" else "null";

              inherit (meta)
                domains
                excludeDomains
                ;
            };
          };
        };
    };

    zapret2 = {
      includes = [
        zen.services.proxy-suite
      ];

      nixos =
        {
          ...
        }:
        let
          meta = zen.services.proxy-suite.meta;
        in
        {
          services.proxy-suite.zapret = {
            enable = true;
            engine = "zapret2";

            zapret2 = {
              inherit (meta)
                domains
                excludeDomains
                ;
            };
          };
        };
    };
  };
}
