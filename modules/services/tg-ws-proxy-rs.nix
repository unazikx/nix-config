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
          secret = config.sops.secrets."services/telegram-ws".path;
        };

        sops.secrets = {
          "services/telegram-ws" = { };
        };
      };
  };
}
