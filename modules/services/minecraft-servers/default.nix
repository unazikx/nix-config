{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
    };
    # keep-sorted end
  };

  zen.services.minecraft-servers = {
    description = ''
      minecraft servers launches via systemd units
      25500 - 25599 ports are for minecraft servers

      plan: add servers
    '';

    includes = [
      zen.services.minecraft-servers.terra-firma-greg
      zen.services.minecraft-servers.vortex
    ];

    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.minecraft-servers;
        dir = "/var/lib/minecraft";
      in
      {
        environment.systemPackages = [
          pkgs.packwiz
          pkgs.mcrcon
        ];

        services.minecraft-servers = {
          enable = true;
          openFirewall = true;

          eula = true;
          dataDir = dir;

          # password=yourawesomepass
          environmentFile = config.security.nix-secrets.secrets."services-minecraft-environment".path;
          # just a plain file ^^^
        };

        security.nix-secrets.secrets = {
          "services-minecraft-environment" = {
            generator.password = {
              length = 16;
              numbers = false;
            };

            owner = cfg.user |> lib.mkForce;

            # waiting for realization in security.nix-secrets
            #
            # when u change password
            # servers will be restarted
            #
            # reloadUnits = lib.concatMap (name: [
            #   "minecraft-server-${name}.socket"
            #   "minecraft-server-${name}.service"
            # ]) (lib.attrNames cfg.servers);
          };
        };
      };
  };
}
