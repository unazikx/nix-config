{
  zen,
  config,
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        pkgs,
        lib,
        ...
      }:
      {
        files =
          {
            path = "secrets/config.yaml";
            drv = pkgs.writers.writeYAML "secrets.yaml" {
              creation_rules =
                let
                  meta = zen.secrets.meta;

                  defaultKeys = lib.attrValues meta.defaultKeys;
                  excludes = meta.excludes;

                  clean = lib.filterAttrs (name: _: !lib.hasPrefix "_" name && !lib.elem name excludes);

                  toEntry = defaultKeys: name: conf: [
                    {
                      inherit name;
                      keys = lib.unique (defaultKeys ++ lib.optional (conf ? age) conf.age);
                    }
                  ];

                  toCombinedEntry = defaultKeys: hostName: hostConf: userName: userConf: [
                    {
                      name = "${userName}-${hostName}";
                      keys = lib.unique (
                        defaultKeys
                        ++ lib.optional (hostConf ? age) hostConf.age
                        ++ lib.optional (userConf ? age) userConf.age
                      );
                    }
                  ];

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
                        toEntry defaultKeys name conf
                        ++ lib.mapAttrsToList (userName: userConf: toEntry defaultKeys userName userConf) (
                          clean (conf.users or { })
                        )
                        ++ lib.mapAttrsToList (toCombinedEntry defaultKeys name conf) (clean (conf.users or { }))
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
                [
                  (
                    allConfigurations
                    |> map (configuration: {
                      path_regex = "${configuration.name}/[^/]+\\.*$";
                      key_groups = [
                        {
                          age = configuration.keys;
                        }
                      ];
                    })
                  )

                  {
                    path_regex = "shared/[^/]+\\.(yaml|json|env|ini)$";
                    key_groups = [
                      {
                        age = sharedKeys;
                      }
                    ];
                  }
                ]
                |> lib.flatten;
            };
          }
          |> lib.singleton;
      };
  };
}
