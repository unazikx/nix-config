{
  self,
  ...
}:

{
  zen.flake-parts.default = {
    root-parts =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        legacyPackages = {
          __cachix =
            let
              prefixes =
                let
                  file = "${self}/github-actions-inputs";
                  additionalPrefixes =
                    file
                    |> lib.readFile
                    |> lib.trim
                    |> lib.splitString " ";

                  defaultPrefixes = [
                    # keep-sorted start
                    "aurelia"
                    "cursors"
                    "firefox-themes"
                    "fonts"
                    "minecraft-servers"
                    "proton"
                    "write-flake"
                    "write-inputs"
                    "write-lock"
                    "yazi-plugins"
                    # keep-sorted end
                  ];
                in
                if lib.pathExists file then
                  (additionalPrefixes ++ defaultPrefixes) |> lib.unique
                else
                  defaultPrefixes;
            in
            config.packages
            |> lib.filterAttrs (
              name: value:
              let
                prefix = prefixes |> lib.any (prefix: lib.hasPrefix prefix name);
                localBuild = (value ? preferLocalBuild) && (value.preferLocalBuild == true);
              in
              !(prefix || localBuild)
            );

          __cachix-farmed =
            config.legacyPackages.__cachix
            |> builtins.mapAttrs (_name: drv: drv)
            |> pkgs.linkFarm "cachix-packages";
        };
      };
  };
}
