{
  zen,
  ...
}:

{
  zen.games.minecraft.prismlauncher = {
    description = ''
      best minecraft launcher
      with easy modpacks support

      stylix:
      https://github.com/nix-community/stylix/pull/2335

      remove own when merged
    '';

    os =
      {
        lib,
        ...
      }:
      {
        networking.firewall = lib.genAttrs [
          "allowedTCPPorts"
          "allowedUDPPorts"
        ] (_: [ 25565 ]);
      };

    homeManager =
      {
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      {
        programs.prismlauncher = {
          enable = true;

          package = pkgs.prismlauncher.override {
            gamemodeSupport = true;
            controllerSupport = true;
            textToSpeechSupport = false;

            jdks = zen.games.minecraft.meta.temurinJRE pkgs;
          };

          settings = {
            # keep-sorted start block=yes
            ApplicationTheme = "stylix";
            AutoCloseConsole = false;
            AutomaticJavaDownload = false;
            AutomaticJavaSwitch = false;
            CatOpacity = 100;
            CentralModsDir = "mods";
            CloseAfterLaunch = false;
            ConfigVersion = "1.2";
            ConsoleOverflowStop = true;
            CustomGLFWPath = "${pkgs.glfw3-minecraft}/lib/libglfw.so";
            DownloadsDir = config.xdg.userDirs.download;
            DownloadsDirWatchRecursive = false;
            EnableMangoHud = config.programs.mangohud.enable;
            IconTheme =
              if (config.stylix.polarity == "dark") then
                "pe_light"
              else if (config.stylix.polarity == "light") then
                "pe_dark"
              else
                null;
            IconsDir = "icons";
            IgnoreJavaCompatibility = false;
            IgnoreJavaWizard = true;
            InstSortMode = "Name";
            InstanceDir = "instances";
            JavaDir = "java";
            JavaPath = lib.getExe pkgs.temurin-jre-bin;
            LastHostname = user.userName;
            LaunchMaximized = false;
            MenuBarInsteadOfToolBar = true;
            MinMemAlloc = 512;
            ModDependenciesDisabled = false;
            ModMetadataDisabled = false;
            NumberOfConcurrentDownloads = 6;
            NumberOfConcurrentTasks = 10;
            NumberOfManualRetries = 1;
            OnlineFixes = true;
            PastebinType = 3;
            PermGen = 128;
            QuitAfterGameStop = false;
            RecordGameTime = true;
            RequestTimeout = 60;
            ShowConsole = false;
            ShowConsoleOnError = true;
            ShowGameTime = true;
            ShowGameTimeWithoutDays = false;
            ShowGlobalGameTime = true;
            SkinsDir = "skins";
            SkipModpackUpdatePrompt = false;
            StatusBarVisible = false;
            TechnicClientID = "";
            ToolbarsLocked = true;
            UseDiscreteGpu = false;
            UseNativeGLFW = true;
            UseNativeOpenAL = false;
            UseZink = false;
            UserAgentOverride = "";
            UserAskedAboutAutomaticJavaDownload = true;
            # keep-sorted end
          };
        };

        xdg.mimeApps = {
          defaultApplications = {
            "application/x-modrinth-modpack+zip" = "org.prismlauncher.PrismLauncher.desktop";
            "x-scheme-handler/curseforge" = "org.prismlauncher.PrismLauncher.desktop";
            "x-scheme-handler/prismlauncher" = "org.prismlauncher.PrismLauncher.desktop";
          };
        };
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        programs.prismlauncher = {
          settings = {
            EnableFeralGamemode = osConfig.programs.gamemode.enable;
            Language = lib.head (lib.split "\\." osConfig.i18n.defaultLocale);
          };
        };
      };
  };
}
