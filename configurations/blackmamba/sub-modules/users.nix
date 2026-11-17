{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        ...
      }:
      {
        users.mutableUsers = false;

        security.nix-secrets.secrets = {
          "password-hackerx" = {
            generator = "hashed-password";
            neededForUsers = true;
          };

          "password-root" = {
            generator = "hashed-password";
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
        hashedPasswordFile = config.sops.secrets."password-${user.userName}".path;
      };
  };

  zen.users.hackerx = {
    user =
      {
        config,
        user,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password-${user.userName}".path;

        extraGroups = [
          # keep-sorted start
          "audio"
          "gamemode"
          "input"
          "media"
          "minecraft"
          "networkmanager"
          "podman"
          "proxy-suite"
          "qbittorrent"
          "users"
          "video"
          "wheel"
          # keep-sorted end
        ];
      };
  };
}
