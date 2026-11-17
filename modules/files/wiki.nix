{
  zen,
  ...
}:

{
  zen.flake-parts.default = {
    includes = [
      zen.custom.wiki
    ];

    files =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        files =
          {
            path = "wallpapers.md";
            drv =
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
              pkgs.writers.writeText "wallpapers.md" ''
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
          }
          |> lib.singleton;
      };
  };
}
