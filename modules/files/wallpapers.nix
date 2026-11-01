{
  zen,
  lib,
  ...
}:

let
  listOfWallpapers = {
    # keep-sorted start block=yes newline_separated=yes
    "Alike Windows XP" = {
      page = "https://wallhaven.cc/w/9og561";
      hash = "sha256-Q9PsKDslsS8vvCGf1o//Ls/hD85wctPoi//uAVP0WLc=";
      extension = "jpg";
    };

    "Arkham Knight: Envy" = {
      page = "https://wallhaven.cc/w/73lprv";
      hash = "sha256-Kd6FmQ2sNfGy1rt0lwmxcMvgb3aUDI72GWfpYA6RXTo=";
      extension = "jpg";
    };

    "Assasins Creed: Black Flag Sea" = {
      page = "https://wallhaven.cc/w/6lyop6";
      hash = "sha256-20iKJrblZuFBIf8mXDK6Q6c516uqOrVFIjJ21gi9DH4=";
      extension = "jpg";
    };

    "BTAS: Joker Vs Batman" = {
      page = "https://wallhaven.cc/w/p91k2e";
      hash = "sha256-eEDDvGYibzy4mD3vT0UiWbK4HDFaypTSNUvYWKqsVLE=";
      extension = "jpg";
    };

    "Blender SU~SHI" = {
      page = "https://wallhaven.cc/w/yq2m77";
      hash = "sha256-ITLcz6W40IcRoLobCK4RhyEq+026Mk3/y7cwQWexrWY=";
      extension = "png";
    };

    "Dredger" = {
      page = "https://wallhaven.cc/w/6lyv5x";
      hash = "sha256-Odpiu2RrlXBZkDeKtU4X0UKP9cW9RuPGZbaxhUdkJL4=";
      extension = "png";
    };

    "Evening Vibes" = {
      page = "https://wallhaven.cc/w/w5o7o7";
      hash = "sha256-9sp+SMkQB9ZwnSOHkYlRD7JBUbwxKdI/v1Vm0i9Xhhk=";
      extension = "png";
    };

    "Fast Food" = {
      page = "https://wallhaven.cc/w/lydqy2";
      hash = "sha256-ZamFBSQZpnLo6zhlcNH7nmjcrMufrYMkElFWZ1oWnLg=";
      extension = "png";
    };

    "Gavryl fog" = {
      page = "https://wallhaven.cc/w/w5x65p";
      hash = "sha256-aUTvlXBCEwi6gPmosh4vgTzbcr3YyJllFm0E5lLW5ks=";
      extension = "jpg";
    };

    "Gavryl snowday" = {
      page = "https://wallhaven.cc/w/z88dww";
      hash = "sha256-mxQCilQ+NRB2RE2PxIANHWZy17aVe8WoRIcM/DqEjSg=";
      extension = "jpg";
    };

    "Gavryl sundown" = {
      page = "https://wallhaven.cc/w/rq6yqm";
      hash = "sha256-zgHMKLb0ZKs9dxftb/KR2LP2+YjrWO4rLl1KoMAYofA=";
      extension = "jpg";
    };

    "Gavryl sunrise" = {
      page = "https://wallhaven.cc/w/575r67";
      hash = "sha256-uAdRbZgeKfSzZftqcIphjtwsm0r2LN4RzoE3rtM4RIA=";
      extension = "jpg";
    };

    "Hitori in Aquapark" = {
      page = "https://wallhaven.cc/w/2y2o1m";
      hash = "sha256-K+4JyqSK4j5/M17WraRO6KnS2u+8QkfLJCT1izjzC2c=";
      extension = "jpg";
    };

    "Kita in Park" = {
      page = "https://wallhaven.cc/w/d8p73g";
      hash = "sha256-jSULD3pTFsJncaJsSPk9r6qJsZyC+5AyLki1kMYmjMA=";
      extension = "png";
    };

    "Lani Cafe" = {
      page = "https://wallhaven.cc/w/ogjjx9";
      hash = "sha256-OuQ4ZBHXSe4Ql2tbvlFOBjSXy4kQMKgkyMBj/sTVg/0=";
      extension = "jpg";
    };

    "Lipsgarets" = {
      page = "https://wallhaven.cc/w/po7ove";
      hash = "sha256-o2jAvGSXVikvAY14t8bjg/8yfFac7kXJXRU3UK5zNEI=";
      extension = "jpg";
    };

    "Mazda MX5 Ahegao" = {
      page = "https://wallhaven.cc/w/k8jgkd";
      hash = "sha256-iai53/5+1iUbalRdWPiuGd/wzcVJ2mSR+CiisM1etME=";
      extension = "png";
    };

    "Mazda MX5 Many" = {
      page = "https://wallhaven.cc/w/rqexj1";
      hash = "sha256-qsa0ppTiC8xLLRc1Y3wbhu1v/ySoSMht+D+/L0iKMRI=";
      extension = "png";
    };

    "Mazda vocaloids" = {
      page = "https://wallhaven.cc/w/poyqx9";
      hash = "sha256-eX6Dp9MjmWoy/VwVmt1CJ16n4x4tz3MmbuIRJcKooqQ=";
      extension = "png";
    };

    "Minecraft Amethyst" = {
      page = "https://wallhaven.cc/w/l8qq3l";
      hash = "sha256-M6bRjpDNR3TClnEyd4WlQtuONkB0JHFZ2x7t3MLRhFE=";
      extension = "png";
    };

    "Minecraft Moon Derpy" = {
      page = "https://wallhaven.cc/w/l36362";
      hash = "sha256-6ODl/fcSlGelTOj8uZgIceALFZzk/7vMS7A5CrYqqC0=";
      extension = "png";
    };

    "Night In The Woods" = {
      page = "https://wallhaven.cc/w/og76qm";
      hash = "sha256-MuGRe/VZBdhCgNjLZzelMa2APRR72GzbHcoMtCajMwA=";
      extension = "jpg";
    };

    "Night palmas" = {
      page = "https://wallhaven.cc/w/7p7llv";
      hash = "sha256-2jLtBIkayHHaBq1+0OmSYmCGj/4T+k7W16qKetPl46Y=";
      extension = "jpg";
    };

    "Nijika in Classroom" = {
      page = "https://wallhaven.cc/w/85wzyy";
      hash = "sha256-jUmSLJ9uXgpdgfU8/EtIRvCrIdwqe1HG5ciIRd9zUGM=";
      extension = "jpg";
    };

    "Pepe XP" = {
      page = "https://wallhaven.cc/w/ogl5z9";
      hash = "sha256-VvnBCulYtyVqJOQ5psLJyIvK8YffWPP8Stz9KgznGcY=";
      extension = "png";
    };

    "Puyo Puyo" = {
      page = "https://wallhaven.cc/w/qrmell";
      hash = "sha256-hz1OTPfSxwskaNWo3t0JpU0MlG9BFyZht79x19OLBeI=";
      extension = "png";
    };

    "Retro Woman" = {
      page = "https://wallhaven.cc/w/p82xoe";
      hash = "sha256-LpPhnaPLdPMkfW8dxCsp/L3YAF1nOBCycX76UFW/mMQ=";
      extension = "png";
    };

    "Sakura Train" = {
      page = "https://wallhaven.cc/w/yqg6r7";
      hash = "sha256-RI/KERuKYPLcIpjawRsElocoOtEcZy6UR/D4dqoLqSg=";
      extension = "jpg";
    };

    "Silhouette" = {
      page = "https://wallhaven.cc/w/e86xlo";
      hash = "sha256-CaQLKhOLBoNd3AK4hysHVDSS8hb8o42F12tkeBBEJ7g=";
      extension = "png";
    };

    "Snowing Vibes" = {
      page = "https://wallhaven.cc/w/vpx6x8";
      hash = "sha256-Zk3jce86mk56pYr/1OzEYjZddFTdhsfWnHrlD4+tBXk=";
      extension = "png";
    };

    "Stanley Parable" = {
      page = "https://wallhaven.cc/w/9o9w3x";
      hash = "sha256-Eubcop/4RvK89YhAemw9qQa47SrUoGR2sLob04sD00Y=";
      extension = "jpg";
    };

    "Trainstation vocaloids" = {
      page = "https://wallhaven.cc/w/qrl18l";
      hash = "sha256-kZkqSGGKArLkkmACCi73Fydn1+SXRtPG1xds2yweQUA=";
      extension = "png";
    };

    "Waterfall with Green" = {
      page = "https://wallhaven.cc/w/4lvlyl";
      hash = "sha256-fywgHd8Yw7vojTqZtVZHrmzYvPRy53jpQS1TM12Szts=";
      extension = "jpg";
    };

    # alike Man in Black
    "Woman in Vocaloids" = {
      page = "https://wallhaven.cc/w/k82p6d";
      hash = "sha256-wa98cjMHwllsUYTftkV/2P7YeIxUsoGKepClUCANJwY=";
      extension = "png";
    };
    # keep-sorted end
  };

  listOfTags = {
    "Stray" = "https://wallhaven.cc/tag/134796";
    "GTA: VI" = "https://wallhaven.cc/tag/149658";
    "Ilya Kuvshinov" = "https://wallhaven.cc/tag/35412";
  };
in

{
  zen.flake-parts.default = {
    includes = [
      zen.custom.wallpapers
    ];

    wallpapers =
      {
        ...
      }:
      let
        process =
          {
            page,
            hash,
            extension,
          }:
          let
            id = page |> lib.match ".*/w/(.*)" |> lib.head;
            sub = id |> lib.substring 0 2;
          in
          {
            inherit page hash extension;
            full = "https://w.wallhaven.cc/full/${sub}/wallhaven-${id}.${extension}";
            small = "https://th.wallhaven.cc/small/${sub}/${id}.jpg";
          };
      in
      listOfWallpapers |> builtins.mapAttrs (_name: value: process value);

    files =
      {
        config,
        ...
      }:
      {
        file."wallpapers.md" =
          let
            formatEntry = name: entry: ''
              [__${name}__](${entry.page}) -> (_${entry.full}_)

              ![${name}](${entry.small})
            '';

            formatTag = name: url: ''
              __${name}__ -> (${url})
            '';
          in
          {
            text = ''
              # Wallpapers

              ${config.wallpapers |> lib.mapAttrsToList formatEntry |> lib.concatStringsSep "\n\n"}

              ## Tags

              ${listOfTags |> lib.mapAttrsToList formatTag |> lib.concatStringsSep "\n\n"}

              ## Total: ${
                config.wallpapers
                |> lib.attrNames
                |> lib.length
                |> toString
              } wallpapers from https://wallhaven.cc
            '';
          };
      };

    legacyPackages =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        sanitize = name: name |> builtins.replaceStrings [ " " ":" "~" ] [ "-" "" "-" ] |> lib.toLower;

        mkWallpapers =
          {
            colors ? [
              "151515"
              "1f1f1f"
              "d9bc8c"
              "8da3b9"
            ],
          }:
          let
            colorsStr = colors |> builtins.concatStringsSep " ";

            processOne =
              name:
              {
                full,
                hash,
                extension,
                ...
              }:
              let
                fileName = sanitize "${name}.${extension}";
                image = builtins.fetchurl {
                  name = fileName;
                  url = full;
                  sha256 = hash;
                };
              in
              pkgs.runCommandLocal "lutgen-${fileName}"
                {
                  buildInputs = [ pkgs.lutgen ];
                  inherit image colorsStr extension;
                }
                ''
                  lutgen apply "$image" -o "$out" -- $colorsStr
                '';

            processed = config.wallpapers |> lib.mapAttrs processOne;
          in
          (
            (
              processed
              |> lib.mapAttrs' (
                name: drv:
                let
                  fileName = sanitize name;
                  extension = config.wallpapers.${name}.extension;
                  fullName = "${fileName}.${extension}";
                in
                lib.nameValuePair fileName (
                  pkgs.runCommandLocal fullName { } ''
                    ln -s ${drv} $out
                  ''
                )
              )
            )
            // {
              _farmed = pkgs.linkFarm "images-farmed" (
                processed
                |> lib.mapAttrsToList (
                  name: drv: {
                    name = "${sanitize name}.${config.wallpapers.${name}.extension}";
                    path = drv;
                  }
                )
              );
            }
          );
      in
      {
        images = lib.makeOverridable mkWallpapers { };
      };
  };
}
