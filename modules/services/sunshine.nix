{
  ...
}:

{
  zen.services.sunshine = {
    description = ''
      remote server for gaming, primary
    '';

    nixos =
      {
        config,
        host,
        ...
      }:
      let
        cfg = config.services.sunshine;
      in
      {
        services.sunshine = {
          enable = true;
          openFirewall = true;

          settings = {
            # keep-sorted start
            controller = "enabled";
            gamepad = "auto";
            keyboard = "enabled";
            mouse = "enabled";
            notify_pre_releases = "disabled";
            sunshine_name = host.hostName;
            system_tray = "enabled";
            upnp = "enabled";
            # keep-sorted end
          };

          applications = {
            env = { };

            apps = [
              {
                name = "Virtual desktop";
                image-path = "${cfg.package}/assets/desktop.png";
                auto-detach = "true";
              }
              {
                name = "Steam Big Picture";
                image-path = "${cfg.package}/assets/steam.png";
                detached = [ "setsid steam steam://open/bigpicture" ];
                auto-detach = "true";
              }
            ];
          };
        };
      };
  };
}
