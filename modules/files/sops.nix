{
  lib,
  config,
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        file."secrets/config.yaml" =
          let
            clean = lib.filterAttrs (name: _: !lib.hasPrefix "_" name);

            toEntry =
              name: conf:
              lib.optional (conf ? age) {
                inherit name;
                keys = [ conf.age ];
              };

            toCombinedEntry =
              hostName: hostConf: userName: userConf:
              lib.optional (userConf ? age) {
                name = "${userName}-${hostName}";
                keys = [
                  (lib.optionalString (hostConf ? age) hostConf.age)
                  userConf.age
                ];
              };

            keysFrom =
              byArch:
              byArch
              |> clean
              |> lib.mapAttrsToList (
                _arch: byName:
                byName
                |> clean
                |> lib.mapAttrsToList (
                  name: conf:
                  toEntry name conf
                  ++ lib.mapAttrsToList toEntry (clean (conf.users or { }))
                  ++ lib.mapAttrsToList (toCombinedEntry name conf) (clean (conf.users or { }))
                )
              )
              |> lib.flatten;

            allConfigurations =
              [
                (keysFrom (config.den.hosts or { }))
                (keysFrom (config.den.homes or { }))
              ]
              |> lib.flatten
              |> lib.unique;

            sharedKeys =
              allConfigurations
              |> map (c: c.keys)
              |> lib.flatten
              |> lib.unique;
          in
          {
            yaml.creation_rules =
              [
                (
                  allConfigurations
                  |> map (configuration: {
                    path_regex = "${configuration.name}/[^/]+\.*$";
                    key_groups = [
                      {
                        age = configuration.keys;
                      }
                    ];
                  })
                )

                {
                  path_regex = "shared/[^/]+\.(yaml|json|env|ini)$";
                  key_groups = [
                    {
                      age = sharedKeys;
                    }
                  ];
                }
              ]
              |> lib.flatten;
          };
      };
  };
}
