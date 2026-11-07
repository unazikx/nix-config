{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   nix-secrets = {
  #     type = "github";
  #     owner = "unnamed-systems";
  #     repo = "nix-secrets";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.nix-secrets = {
    includes = [
      zen.hardware.security.yubikey
      zen.miscellaneous.secrets
    ];

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.nix-secrets.nixosModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;
        };
      };

    homeManager =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.nix-secrets.homeManagerModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;
        };
      };

    homeManagerNixos =
      {
        self,
        lib,
        host,
        user,
        ...
      }:
      let
        meta = zen.secrets.meta;

        keyFilePath =
          if (host.hasAspect zen.hardware.security.yubikey) then meta.yubikey else "/secrets/age-key";
      in
      {
        security.nix-secrets = {
          storage = "${self}/secrets/${user.userName}/nixed";
          storagePath = "${host.flakeDir}/secrets/${user.userName}/nixed";

          identityPaths = keyFilePath |> lib.singleton;

          recipientAliases = {
            "${host.hostName}" = host.secrets.age;
            "${user.userName}" = user.secrets.age;
          };

          secrets = {
            password = {
              recipients = [ host.hostName ];
              generator = "password";
            };
          };
        };
      };
  };
}
