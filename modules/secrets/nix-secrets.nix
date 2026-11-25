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
        self',
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

          generators =
            let
              script = code: pkgs.writeShellScript "generator" code;
            in
            {
              random-word =
                {
                  quanity ? 1,
                }:
                script
                  # bash
                  ''
                    ${lib.getExe pkgs.xkcdpass} -n ${toString quanity}
                  '';

              random-pseudoword =
                {
                  length ? 8,
                  quanity ? 1,
                }:
                script
                  # bash
                  ''
                    ${lib.getExe pkgs.pwgen} -A0 ${toString length} ${toString quanity}
                  '';

              hashed-password =
                { }:
                script
                  # bash
                  ''
                    ${lib.getExe pkgs.mkpasswd} -m yescrypt
                  '';

              openssl =
                {
                  length ? 16,
                }:
                script
                  # bash
                  ''
                    ${lib.getExe pkgs.openssl} rand -hex ${toString length}
                  '';

              qbittorrent-password =
                { }:
                script
                  # bash
                  ''
                    printf "Input: " > /dev/tty; read -r input < /dev/tty
                    exec ${lib.getExe self'.packages.qbittorrent-pbkdf2} "$input"
                  '';
            };
        };
      };

    homeManagerNixos =
      {
        self,
        inputs,
        pkgs,
        lib,
        osConfig,
        host,
        user,
        ...
      }:
      let
        osCfg = osConfig.security.nix-secrets;
      in
      {
        imports = [
          inputs.nix-secrets.homeManagerModules.nix-secrets
        ];

        security.nix-secrets = {
          enable = true;

          inherit (osCfg)
            extraPackages
            identityPaths
            recipientAliases
            defaultRecipients
            ;

          generators = lib.mkForce osCfg.generators;

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
