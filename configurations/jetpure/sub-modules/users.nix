{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        ...
      }:
      {
        users.mutableUsers = false;

        sops.secrets = {
          "password/nixzoid" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };

        security.nix-secrets.secrets = {
          "password/nixzoid" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };
      };
  };

  zen.users.root = {
    user =
      {
        config,
        user,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password/${user.userName}".path;
      };
  };

  zen.users.nixzoid = {
    user =
      {
        config,
        user,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password/${user.userName}".path;

        extraGroups = [
          # keep-sorted start
          "audio"
          "deluge"
          "docker"
          "gamemode"
          "input"
          "libvirtd"
          "media"
          "minecraft"
          "networkmanager"
          "podman"
          "proxy-suite"
          "qbittorrent"
          "suwayomi"
          "terraria"
          "transmission"
          "users"
          "video"
          "wheel"
          config.services.kubo.group
          # keep-sorted end
        ];
      };
  };
}
