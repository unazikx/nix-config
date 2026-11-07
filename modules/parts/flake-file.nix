{
  inputs,
  config,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-file = {
      type = "github";
      owner = "unazikx";
      repo = "flake-file";
    };
    # keep-sorted end
  };

  imports = [
    inputs.flake-file.flakeModules.flake
  ];

  flake-file = {
    do-not-edit = "";

    outputs =
      # nix
      ''
        inputs:
        (inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            [
              ./configurations
              ./modules
            ]
            |> inputs.import-tree
          )
        )
      '';

    nixConfig = {
      accept-flake-config = true;
      warn-dirty = false;
      extra-experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
    };

    style = {
      sep.inputs = "
          \n
        ";

      sortPriority = {
        flake = [
          "description"
          "inputs"
          "outputs"
          "nixConfig"
        ];
      };
    };
  };

  zen.flake-parts.default = {
    packages =
      {
        pkgs,
        ...
      }:
      {
        write-flake = config.flake-file.apps.write-flake pkgs;
        write-lock = config.flake-file.apps.write-lock pkgs;
      };
  };
}
