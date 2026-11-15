{
  self,
  den,
  zen,
  ...
}:

{
  den.classes = {
    # keep-sorted start
    actions = { };
    diskoUSB = { };
    overlays = { };
    root = { };
    wrappers = { };
    # keep-sorted end
  };

  den.policies = {
    # keep-sorted start block=yes newline_separated=yes
    actions-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "actions";
          intoClass = "flake";
          path = [
            "flake"
            "REPLACE_ME"
          ];
        })
      ];

    disko-other-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "diskoUSB";
          intoClass = "flake";
          path = [
            "flake"
            "diskoConfigurations"
          ];
        })
      ];

    overlays-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "overlays";
          intoClass = "flake";
          path = [
            "flake"
            "overlays"
          ];
          adaptArgs =
            {
              ...
            }:
            {
              inherit self;
            };
        })
      ];

    root-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "root";
          intoClass = "flake";
          path = [
            "flake"
          ];
        })
      ];

    wrappers-to-flake-system =
      {
        ...
      }:
      [
        (den.lib.policy.route {
          fromClass = "wrappers";
          intoClass = "flake";
          path = [
            "wrappers"
          ];
          adaptArgs =
            {
              ...
            }:
            {
              inherit self;
            };
        })
      ];
    # keep-sorted end
  };

  den.schema.flake-system.includes = [
    # keep-sorted start
    den.policies.actions-to-flake-system
    den.policies.disko-other-to-flake-system
    den.policies.overlays-to-flake-system
    den.policies.root-to-flake-system
    zen.flake-system.default
    # keep-sorted end
  ];
}
