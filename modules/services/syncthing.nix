{
  ...
}:

{
  zen.services.syncthing = {
    description = ''
      simple synchronizer between devices
      idk how but i will hide id devices
    '';

    homeManagerNixos =
      {
        pkgs,
        config,
        user,
        ...
      }:
      {
        home.packages = [
          pkgs.stc-cli
        ];

        services.syncthing = {
          enable = true;

          guiAddress = "0.0.0.0:8384";

          guiCredentials = {
            username = user.userName;
            passwordFile = config.security.nix-secrets.secrets."services-syncthing-gui".path;
          };

          cert = config.security.nix-secrets.secrets."services-syncthing-cert".path or null;
          key = config.security.nix-secrets.secrets."services-syncthing-key".path or null;

          settings.options = {
            relaysEnabled = true;
            urAccepted = -1;
            localAnnounceEnabled = true;
            localAnnouncePort = 21027;
          };
        };

        security.nix-secrets.secrets = {
          "services-syncthing-gui" = { };
          "services-syncthing-cert" = { };
          "services-syncthing-key" = { };
        };
      };
  };
}
