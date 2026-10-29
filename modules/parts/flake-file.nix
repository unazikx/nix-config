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
    inputs.flake-file.flakeModules.lon
    inputs.flake-file.flakeModules.tack
  ];

  flake-file = {
    do-not-edit = "";

    outputs =
      # nix
      ''
        inputs:
        inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            inputs.import-tree [
              ./configurations
              ./files
              ./modules
              ./shells
            ]
          )
      '';

    lon.lockDir = ".lon";

    prune-lock.enable = true;

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
        lib,
        ...
      }:
      let
        unset =
          exec:
          pkgs.writeShellScriptBin "write-lon" ''
            LON_DIRECTORY= ; ${exec pkgs |> lib.getExe}
          '';
      in
      {
        write-lon = config.flake-file.apps.write-lon |> unset;
        write-lock = config.flake-file.apps.write-lock |> unset;
        write-tack = config.flake-file.apps.write-tack pkgs;
      };
  };
}
