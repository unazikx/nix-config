/*
  Keep up, I'm too fast, I'm too fast
  Push my foot up on that pedal, then I'm gone
  (G-g-g-gone, gone, gone)
  Keep up on my track, on my track
  Boy, I'll dust ya, keep my numbers going strong
  (Strong, strong, str-str-str-strong)

  KEEP UP lyrics © Kobalt Music Publishing Ltd.
*/

{
  zen,
  ...
}:

{
  zen.games.srb2 = {
    description = ''
      sonic game, best on my opinion
    '';

    meta = {
      package = pkgs: pkgs.srb2;
    };

    wiki = {
      "Sonic Robo Blast 2" = {
        links = [
          {
            name = "addons-list";
            link = "https://mb.srb2.org/addons";
            logo = "https://srb2mb-externaldata.nyc3.cdn.digitaloceanspaces.com/data/assets/logo/srb2mb_sonic.png";
          }
          {
            name = "multiplayer-guide";
            link = "https://www.srb2.org/about/multiplayer";
            logo = "https://www.srb2.org/wp-content/themes/srb2/images/srb2org-banner.png";
          }
        ];
      };
    };

    homeManagerNixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.srb2.meta;
        game = meta.package pkgs;
      in
      [
        {
          home.packages = [ game ];
        }
        (
          {
            "Sonic Robo Blast 2" = {
              target = game;
              # i should add artwork, but lazy
            };
          }
          |> lib.optionalAttrs (user.hasAspect zen.games.steam)
          |> (nonSteamApps: {
            programs.steam.config.nonSteamApps = nonSteamApps;
          })
        )
      ]
      |> lib.mkMerge;
  };

  zen.flake-parts.default = {
    includes = [ zen.games.srb2 ];
  };
}
