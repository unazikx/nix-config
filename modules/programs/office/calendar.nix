{
  zen,
  ...
}:

{
  zen.programs.office.calendar = {
    includes = [
      zen.programs.office.vdirsyncer
    ];

    homeManager =
      {
        config,
        ...
      }:
      {
        accounts.calendar.basePath = ".calendar";

        accounts.calendar.accounts = {
          "Personal" = {
            primary = true;
            remote.type = "google_calendar";

            noctalia.enable = true;

            vdirsyncer = {
              enable = true;

              collections = [
                "from a"
                "from b"
              ];

              conflictResolution = "remote wins";
              tokenFile = "${config.accounts.calendar.basePath}/Personal/token";

              clientIdCommand = [
                "cat"
                config.security.nix-secrets.secrets."calendar-personal-id".path
              ];

              clientSecretCommand = [
                "cat"
                config.security.nix-secrets.secrets."calendar-personal-secret".path
              ];
            };
          };
        };

        security.nix-secrets.secrets = {
          "calendar-personal-id" = { };
          "calendar-personal-secret" = { };
        };
      };
  };
}
