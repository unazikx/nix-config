{
  zen,
  ...
}:

{
  zen.miscellaneous.nix = {
    description = ''
      sets lix as nix package
      added registry bases on inputs
    '';

    includes = [
      zen.custom.nixpkgs
      # zen.miscellaneous.nix.lix
      zen.miscellaneous.nix.overlays
      zen.miscellaneous.nix.settings
    ];

    os =
      {
        self',
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          self'.packages.hasher
          pkgs.cachix
          pkgs.hydra-check
          pkgs.nix-tree
          pkgs.nurl
        ];

        nixpkgs.config.allowUnfree = true;
      };

    nixos =
      {
        inputs,
        lib,
        ...
      }:
      {
        nix = {
          enable = true;

          registry =
            let
              isFlake = lib.filterAttrs (_: entry: lib.isType "flake" entry);
              mapping = lib.mapAttrs (_: flake: { inherit flake; });
            in
            inputs |> isFlake |> mapping;

          channel.enable = false;

          settings.flake-registry = "";
        };
      };

    finix =
      {
        self,
        inputs,
        ...
      }:
      {
        imports = [
          "${inputs.finix}/modules/services/nix-daemon"
        ];

        services.nix-daemon = {
          enable = true;
        };

        nixpkgs = {
          overlays = [
            self.overlays.nixpkgs-branches
            self.overlays.system-backport
          ];
        };
      };

    homeManager =
      {
        ...
      }:
      {
        nixpkgs.config.allowUnfree = true;
      };
  };
}
