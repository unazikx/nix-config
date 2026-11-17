{
  zen,
  ...
}:

{
  zen.programs.desktop.sunsetr = {
    description = ''
      blue filter
      for eyes saver

      universal for all wayland comp
    '';

    includes = [
      zen.custom.sunsetr
    ];

    homeManagerNixos =
      {
        config,
        ...
      }:
      {
        services.sunsetr = {
          enable = true;

          geoLocation =
            config.lib.file.mkOutOfStoreSymlink
              config.security.nix-secrets.secrets."services-sunsetr".path;

          settings = {
            backend = "auto";
            transition_mode = "geo";

            smoothing = true;
            startup_duration = 2;
            shutdown_duration = 2;
            adaptive_interval = 1;

            day_temp = 6500;
            day_gamma = 100;

            night_temp = 4800;
            night_gamma = 90;

            static_temp = 6500;
            static_gamma = 100;

            transition_duration = 45;
            update_interval = 60;
          };

          presets = {
            gaming = {
              backend = "auto";
              transition_mode = "static";
              smoothing = true;
              startup_duration = 0.5;
              shutdown_duration = 0.5;
              adaptive_interval = 1;
              static_temp = 6500;
              static_gamma = 115;
            };

            reading = {
              backend = "auto";
              transition_mode = "static";
              smoothing = true;
              startup_duration = 0.5;
              shutdown_duration = 0.5;
              adaptive_interval = 1;
              static_temp = 3000;
              static_gamma = 80;
            };

            static = {
              backend = "auto";
              transition_mode = "static";
              smoothing = true;
              startup_duration = 0.5;
              shutdown_duration = 0.5;
              adaptive_interval = 1;
              static_temp = 6500;
              static_gamma = 100;
            };
          };
        };

        security.nix-secrets.secrets = {
          "services-sunsetr" = { };
        };
      };
  };
}
