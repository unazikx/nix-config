{
  zen,
  ...
}:

{
  zen.services.mango-reader = {
    description = ''
      mihon compat manga reader
    '';

    includes = [
      zen.hardware.virtualization.podman
    ];

    homeManagerNixos =
      {
        config,
        ...
      }:
      {
        services.podman = {
          containers."Mango-Reader" = {
            autoStart = true;

            image = "ghcr.io/apixelsnet/mango:full";

            environment = {
              MANGO_LOGIN = "off";
              MANGO_RELEASES_CHECK_HOURS = 0;
            };

            ports = [
              "8787:8787"
            ];

            volumes = [
              "mango-storage:/data"

              "${config.xdg.userDirs.documents}:/data/local/documents:ro"
            ];
          };

          volumes = {
            "mango-storage" = { };
          };
        };
      };
  };
}
