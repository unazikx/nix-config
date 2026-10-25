{
  zen,
  ...
}:

{
  zen.services.proxy-suite = {
    zapret-discord-youtube = {
      includes = [
        zen.services.proxy-suite
      ];

      nixos =
        {
          config,
          ...
        }:
        {
          services.proxy-suite.zapret = {
            enable = true;
            engine = "zapret-discord-youtube";

            zapret-discord-youtube = {
              configName = "general (ALT12)";
              gameFilter = if config.programs.steam.enable then "all" else "null";

              excludeDomains = [
                "statsigapi.net"
                "desktop-config.juno.ea.com"
                "e16166.e12.akamaiedge.net"
                "confluence.ea.com"
                "events.statsigapi.net"
                "ratt.juno.ea.com"
                "service-aggregation-layer.juno.ea.com"
                "autopatch.juno.ea.com"
                "accounts.ea.com"
                "gcs.ea.com"
                "a1819.g1.akamai.net"
                "accounts.aws-gslb.prod.ea.com"
                "freeform-river.data.ea.com"
                "k8s-riverpro-captures-9f8dbb0ba5-1345960063.us-east-1.elb.amazonaws.com"
                "service-aggregation-layer-subs.juno.ea.com"
                "rtm.tnt-ea.com"
                "antelope-rtm-prod-black-519949175.us-east-1.elb.amazonaws.com"
                "eaavatarservice.akamaized.net"
                "pin-river.data.ea.com"
                "pc.ea.com"
                "e4391.a.akamaiedge.net"
                "api.k.social.ea.com"
                "groups.gameservices.ea.com"
                "a2fcbecc7b7634c9484099978824a668-d99627c9b1d1dedd.elb.us-east-1.amazonaws.com"
                "assetsconfigcdn.org"
                "friends.gs.ea.com"
                "bam.nr-data.net"
                "fastly-tls12-bam.nr-data.net"
                "ad25e1c7500ff480283bff9539134919-d0e9b8b37a18a890.elb.us-east-1.amazonaws.com"
                "qos-nlb-eu-central-1-a7e1db11a0d0e214.elb.eu-central-1.amazonaws.com"
                "contentful-proxy.juno.ea.com"
                "_8095._https.rtm.tnt-ea.com"
                "checkout.ea.com"
                "cloudsync.juno.ea.com"
                "a1754.dscr.akamai.net"
                "prodregistryv2.org"
                "cloudsync-prod.s3.us-east-1.amazonaws.com"
                "s3-r-w.us-east-1.amazonaws.com"
                "gateway.ea.com"
                "proxy.novafusion.ea.com"
                "R2-pc.s3.amazonaws.com"
                "R2-pc.stryder.respawn.com"
                "R2-pc-stats.stryder.respawn.com"

                # steam exludes
                # https://steamcommunity.com/discussions/forum/26/590688141302576561
                "steampowered.com"
                "steamcommunity.com"
                "steamstatic.com"
                "steamcdn-a.akamaihd.net"
                "steamuserimages-a.akamaihd.net"
                "steamcontent.com"
                "steam-api.com"
                "steam-chat.com"
                "s.team"
                "valvesoftware.com"
                "steamgames.com"
                "steam.tv"
                "steamdeck.com"
                "playartifact.com"
                "underlords.com"

                # spotify excludes for hosts
                "api.spotify.com"
                "login5.spotify.com"
                "encore.scdn.co"
                "gew1-spclient.spotify.com"
                "spclient.wg.spotify.com"
                "api-partner.spotify.com"
                "aet.spotify.com"
                "www.spotify.com"
                "accounts.spotify.com"
                "open.spotify.com"
                "accounts.scdn.co"
                "gew1-dealer.spotify.com"
                "www-growth.scdn.co"
              ];
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
        {
          services.proxy-suite.zapret = {
            enable = true;
            engine = "zapret2";

            zapret2 = {
              # for blocked
              domains = [
                "modrinth.com"
                "anilist.co"
                "app.mangoreader.org"

                "api.spotify.com"
                "login5.spotify.com"
                "encore.scdn.co"
                "gew1-spclient.spotify.com"
                "spclient.wg.spotify.com"
                "api-partner.spotify.com"
                "aet.spotify.com"
                "www.spotify.com"
                "accounts.spotify.com"
                "open.spotify.com"
                "accounts.scdn.co"
                "gew1-dealer.spotify.com"
                "www-growth.scdn.co"
              ];

              # dont touch
              excludeDomains = [ ];
            };
          };
        };
    };
  };
}
