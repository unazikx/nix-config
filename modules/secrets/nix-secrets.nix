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
      ref = "dev";
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

          storage = "${self}/secrets/${host.hostName}";
          storagePath = "${host.flakeDir}/secrets/${host.hostName}";

          identityPaths = secretsMeta.yubikey |> lib.singleton;
          recipientAliases = secretsMeta.defaultKeys;
          defaultRecipients = lib.attrNames config.security.nix-secrets.recipientAliases;
        };
      };

    homeManagerNixos =
      {
        self,
        inputs,
        pkgs,
        lib,
        config,
        osConfig,
        host,
        user,
        ...
      }:
      let
        secretsMeta = zen.secrets.meta;
      in
      {
        imports = [
          inputs.nix-secrets.homeManagerModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;

          extraPackages = osConfig.security.nix-secrets.extraPackages;

          storage = "${self}/secrets/${user.userName}";
          storagePath = "${host.flakeDir}/secrets/${user.userName}";

          identityPaths = secretsMeta.yubikey |> lib.singleton;
          recipientAliases = secretsMeta.defaultKeys;
          defaultRecipients = lib.attrNames config.security.nix-secrets.recipientAliases;
        };

        home.packages = [
          (pkgs.writeShellScriptBin "nix-secrets-user" ''
            nix-secrets --hm ${user.userName} $@
          '')
        ];
      };
  };
}
