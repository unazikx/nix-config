{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    tg-ws-proxy-rs = {
      type = "github";
      owner = "gerasti";
      repo = "tg-ws-proxy-pc";
      ref = "nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.services.tg-ws-proxy-rs = {
    description = ''
      bittorrent client in rust
    '';

    nixos =
      {
        inputs,
        config,
        ...
      }:
      {
        imports = [
          inputs.tg-ws-proxy-rs.nixosModules.default
        ];

        services.tg-ws-proxy-rs = {
          enable = true;

          port = 1444;
          secret = config.security.nix-secrets.secrets."services-telegramws".path;
        };

        security.nix-secrets.secrets = {
          "services-telegramws" = {
            generator = "openssl";
          };
        };
      };
  };
}
