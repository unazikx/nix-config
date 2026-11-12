{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-secrets = {
      type = "github";
      owner = "unnamed-systems";
      repo = "nix-secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.secrets.nix-secrets = {
    includes = [
      zen.hardware.security.yubikey
      zen.secrets
    ];

    nixos =
      {
        self,
        inputs,
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      let
        secretsMeta = zen.secrets.meta;
      in
      {
        imports = [
          inputs.nix-secrets.nixosModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;

          extraPackages = [
            pkgs.age-plugin-yubikey
          ];

          storage = "${self}/secrets/${host.hostName}/_nixed";
          storagePath = "${host.flakeDir}/secrets/${host.hostName}/_nixed";

          identityPaths = secretsMeta.yubikey |> lib.singleton;
          recipientAliases = secretsMeta.defaultKeys;
          defaultRecipients = lib.attrNames config.security.nix-secrets.recipientAliases;
        };
      };
  };
}
