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

          generators = {
            hashed-password =
              { }:
              pkgs.writeShellScript "password-generator" ''
                ${lib.getExe pkgs.mkpasswd} -m yescrypt
              '';

            openssl =
              { numbers }:
              pkgs.writeShellScript "password-generator" ''
                ${lib.getExe pkgs.openssl} rand -hex ${toString numbers}
              '';
          };
        };
      };

    homeManagerNixos =
      {
        self,
        inputs,
        pkgs,
        osConfig,
        host,
        user,
        ...
      }:
      {
        imports = [
          inputs.nix-secrets.homeManagerModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;

          inherit (osConfig.security.nix-secrets)
            extraPackages
            generators
            identityPaths
            recipientAliases
            defaultRecipients
            ;

          storage = "${self}/secrets/${user.userName}";
          storagePath = "${host.flakeDir}/secrets/${user.userName}";
        };

        home.packages = [
          (pkgs.writeShellScriptBin "nix-secrets-user" ''
            nix-secrets --hm ${user.userName} $@
          '')
        ];
      };
  };
}
