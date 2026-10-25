{
  ...
}:

{
  zen.programs.gui.qutebrowser.quickmarks = {
    homeManager =
      {
        lib,
        ...
      }:
      {
        programs.qutebrowser.quickmarks =
          {
            # search
            forget = "4get.ca";
            google = "www.google.com";
            ddg = "duckduckgo.com";

            # nix
            nixpkgs = "search.nixos.org/packages?channel=unstable";
            nixSearch = "nixsearch.thekoppe.com";
            nixosWiki = "wiki.nixos.org";
            prTracker = "nixpk.gs/pr-tracker.html";
            noogle = "noogle.dev";

            # git
            github = "github.com";

            # social
            youtube = "www.youtube.com";
            gmail = "mail.google.com";
            dvach = "2ch.su";

            # anime etc
            anilist = "anilist.co";
            anichart = "anichart.net";
            anilibria = "anilibria.top";
            animeGo = "animego.club/index";
            yummyAnime = "yummy-anime.org";
            dreamCast = "dreamerscast.com";
            miruro = "miruro.tv";
            anikai = "anikai.ro/home";
            mangoreader = "app.mangoreader.org";

            # torrents
            rutracker = "rutracker.org";
            pirateBay = "thepiratebay.org";
            pirateBayProxy = "piratebayproxy.net";
            broTorrent = "brotorrent.net";
            smallGames = "small-games.info";
            tuttop = "tuttop.com";
            freeTP = "freetp.org";

            # games
            modrinth = "modrinth.com";
            mineWiki = "ru.minecraft.wiki";
            steamDB = "steamdb.info";
            steamPeek = "steampeek.hu";
            protonDB = "protondb.com";
            gogDB = "www.gogdb.org";
            egsDB = "egdata.app";

            # ai
            ddgAi = "duck.ai";
            googleAi = "www.google.com/aimode";
            chatGpt = "chatgpt.com";
            deekpeek = "chat.deepseek.com";
            claude = "claude.ai";
          }
          |> lib.mapAttrs (_: value: "https://${value}");
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        programs.qutebrowser = {
          quickmarks =
            (
              (lib.listToAttrs (
                map (
                  domain:
                  let
                    withoutSuffix = lib.head (builtins.split "\\.jetpure\\.local" domain);
                    withUnderscores = lib.replaceStrings [ "." ] [ "_" ] withoutSuffix;
                  in
                  {
                    name = "_${withUnderscores}Local";
                    value = domain;
                  }
                ) (lib.attrNames osConfig.services.caddy.virtualHosts)
              ))
              |> lib.mapAttrs (_: value: "https://${value}")
            )
            |> lib.mkIf osConfig.services.caddy.enable;
        };
      };
  };
}
