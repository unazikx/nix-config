{
  zen,
  ...
}:

{
  zen.flake-parts.default = {
    includes = [
      # keep-sorted start
      zen.custom.wiki
      zen.games.hytale
      zen.games.minecraft
      zen.games.srb2
      zen.games.steam
      zen.miscellaneous.finix
      zen.programs.desktop.noctalia
      zen.services.proxy-suite.amneziawg
      # keep-sorted end
    ];

    files =
      {
        lib,
        config,
        ...
      }:
      {
        file."wiki.md" = {
          enable = false;
          text =
            let
              formatLinks =
                links:
                links
                |> map (entry: ''
                  - <img src="${entry.logo}" height="24"> ${entry.name} -> ${entry.link}

                    ${toString entry.extra}

                '')
                |> lib.concatStrings;

              formatWiki = name: data: ''
                ## __${name}__

                ${data.extra or (toString null)}

                ${formatLinks data.links}
              '';
            in
            ''
              # Wiki for various programs, and my notes for them

              > take icons from here:
              > https://dashboardicons.com
              > https://simpleicons.org

              ${
                config.wiki
                |> builtins.attrNames
                |> map (name: formatWiki name config.wiki.${name})
                |> lib.concatStrings
              }

              ## Total: ${
                config.wiki
                |> builtins.attrNames
                |> lib.length
                |> toString
              } wikis
            '';
        };
      };
  };
}
