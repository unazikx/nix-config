{
  zen,
  ...
}:

{
  zen.games.heroic = {
    description = ''
      epic games launcher
      and gog, very good

      in plans make add games to steam
    '';

    includes = [
      zen.custom.heroic
    ];

    homeManager =
      {
        self',
        config,
        ...
      }:
      {
        programs.heroic = {
          enable = true;

          proton = self'.packages.proton-ge;

          sharedPrefix = "${config.home.homeDirectory}/.heroic/prefixes/shared";

          settings = {
            userHome = config.home.homeDirectory;

            defaultSettings = {
              enviromentOptions = [ ];
              wrapperOptions = [ ];

              analyticsOptIn = false;
              checkForUpdatesOnStartup = false;
              checkUpdatesInterval = 0;
              enableUpdates = false;
              hideChangelogsOnStartup = true;

              addDesktopShortcuts = false;
              addStartMenuShortcuts = false;
              libraryTopSection = "recently_played";

              autoInstallDxvk = true;
              autoInstallVkd3d = true;
              autoInstallDxvkNvapi = true;

              addSteamShortcuts = false;
              preferSystemLibs = true;
              autoUpdateGames = false;

              language = "en";
              maxWorkers = 0;
              minimizeOnLaunch = false;
              nvidiaPrime = false;
              showFps = false;
              useGameMode = true;

              battlEyeRuntime = true;
              disableUMU = false;
              eacRuntime = true;
              enableEsync = true;
              enableFsync = true;
              enableHDR = false;
              enableMsync = false;
              enableWineWayland = false;
              enableWoW64 = true;

              beforeLaunchScriptPath = "";
              afterLaunchScriptPath = "";

              framelessWindow = false;
              verboseLogs = true;
              downloadProtonToSteam = false;
              advertiseAvxForRosetta = false;

              noTrayIcon = false;
              showValveProton = false;

              disableSmoothScrolling = true;

              exitToTray = true;
              darkTrayIcon = false;
              discordRPC = true;

              maxRecentGames = 5;
              allTilesInColor = true;
              titlesAlwaysVisible = true;
            };
          };

          games = {
            "48619f5656da446abccb727b78cda644" = { };
          };
        };
      };
  };
}
