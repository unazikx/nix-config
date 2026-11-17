{
  den,
  zen,
  ...
}:

{
  den.classes = {
    # keep-sorted start
    apps = { };
    devshells = { };
    files = { };
    legacyPackages = { };
    packages = { };
    root-parts = { };
    wallpapers = { };
    wiki = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
    apps-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "apps";
          intoClass = "flake-parts";
          path = [
            "apps"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    devshells-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "devshells";
          intoClass = "flake-parts";
          path = [
            "devshells"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    files-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "files";
          intoClass = "flake-parts";
          path = [
            "files"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    legacyPackages-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "legacyPackages";
          intoClass = "flake-parts";
          path = [
            "legacyPackages"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    root-parts-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "root-parts";
          intoClass = "flake-parts";
          path = [ ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    wallpapers-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "wallpapers";
          intoClass = "flake-parts";
          path = [
            "wallpapers"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];

    wiki-to-flake-parts =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "wiki";
          intoClass = "flake-parts";
          path = [
            "wiki"
          ];
          adaptArgs =
            {
              config,
              ...
            }:
            config.allModuleArgs;
        })
      ];
    # keep-sorted end
  };

  den.schema.flake-parts.includes = [
    # keep-sorted start
    den.policies.apps-to-flake-parts
    den.policies.devshells-to-flake-parts
    den.policies.files-to-flake-parts
    den.policies.legacyPackages-to-flake-parts
    den.policies.packages-to-flake-parts
    den.policies.root-parts-to-flake-parts
    den.policies.wallpapers-to-flake-parts
    den.policies.wiki-to-flake-parts
    zen.flake-parts.default
    # keep-sorted end
  ];

  den.schema.flake-system.excludes = [
    # keep-sorted start
    den.policies.packages-to-flake
    # keep-sorted end
  ];
}
