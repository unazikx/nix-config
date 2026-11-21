{
  zen.custom.heronite = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      let
        cfg = config.programs.heronite;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "heronite";
              humanName = "Heronite Launcher";
            }
            {
              config = [
                (
                  {
                    colors,
                  }:
                  {
                    xdg.configFile = {
                      "heronite/appearance.json".source = json.generate "heronite-appearance.json" {
                        accent = "game";
                        accentColour = null;
                        autoView = false;
                        autoViewWidth = 1400;
                        background = "art";
                        backgroundSlideshow = true;
                        categoryStyle = "tags";
                        collectionOpacity = 100;
                        coverBadges = true;
                        coverCategories = true;
                        coverCorners = "soft";
                        coverHover = "glow";
                        coverLabel = "none";
                        coverStores = true;
                        coverStoresAll = true;
                        coverStoresHideGrouped = false;
                        customPalette = {
                          accent = colors.withHashtag.base0E;
                          base = "dark";
                          lift = colors.withHashtag.base0B;
                          muted = colors.withHashtag.base04;
                          page = colors.withHashtag.base01;
                          panel = colors.withHashtag.base00;
                          text = colors.withHashtag.base05;
                        };
                        customThemes = [
                          {
                            accent = colors.withHashtag.base0E;
                            base = "dark";
                            lift = colors.withHashtag.base0B;
                            muted = colors.withHashtag.base04;
                            name = "Stylix";
                            page = colors.withHashtag.base01;
                            panel = colors.withHashtag.base00;
                            text = colors.withHashtag.base05;
                          }
                        ];
                        density = "comfortable";
                        font = "system";
                        hiddenSections = [
                          "media"
                          "links"
                        ];
                        highContrast = false;
                        homeBackground = "auto";
                        interfaceBlur = 30;
                        interfaceMode = "solid";
                        interfaceOpacity = 95;
                        interfaceScale = null;
                        interfaceSolidColour = null;
                        interfaceSolidColourLight = null;
                        interfaceSolidDesktop = false;
                        interfaceSolidTint = "slate";
                        interfaceSolidTintLight = "paper";
                        motion = "full";
                        openWithGame = true;
                        quickToolbarControls = true;
                        sections = [
                          "screenshots"
                          "overview"
                          "media"
                          "details"
                          "links"
                          "achievements"
                          "timeline"
                          "related"
                        ];
                        startView = "grid";
                        theme = "custom";
                      };

                      "heronite/console.json".source = json.generate "heronite-console.json" {
                        autoConsole = "ask";
                        consoleButton = "off";
                        controller = {
                          confirm = "auto";
                          glyphs = "auto";
                        };
                        fullscreen = true;
                        idle = "off";
                        keptFilters = {
                          carousel = 0;
                          favourites = false;
                          show = 0;
                          sort = 0;
                        };
                        lastTab = 0;
                        openIn = "last";
                        theme = {
                          author = user.userName;
                          background = {
                            blur = 24;
                            dim = 50;
                            image = "";
                            motion = "drift";
                            source = "game-colour";
                          };
                          colors = {
                            background = colors.withHashtag.base00;
                            focusText = colors.withHashtag.base00;
                            muted = colors.withHashtag.base04;
                            on = colors.withHashtag.base0B;
                            panel = colors.withHashtag.base00;
                            text = colors.withHashtag.base05;
                          };
                          controls = {
                            hints = "always";
                            soundStyle = "soft";
                            soundVolume = 100;
                            sounds = true;
                          };
                          description = "";
                          dimOthers = true;
                          format = 1;
                          gamePage = "sheet";
                          hero = {
                            align = "left";
                            factStyle = "line";
                            facts = true;
                            overview = true;
                            size = "medium";
                            stats = false;
                            title = "text";
                          };
                          id = "stylix";
                          interface = {
                            accent = colors.withHashtag.base0E;
                            clock = "24h";
                            date = true;
                            font = "system";
                            headings = "normal";
                            label = "";
                            motion = "full";
                            scale = 100;
                            statusIcons = true;
                            tabBar = "names";
                          };
                          layouts = {
                            carouselReflect = false;
                            dashboard = {
                              downloads = true;
                              journal = true;
                              random = true;
                              shortcuts = true;
                              week = true;
                            };
                            gridPanel = "title";
                            jumpLetters = true;
                            spotlightActions = "full";
                            spotlightCards = true;
                            wheelItems = "name";
                            xboxGroups = true;
                          };
                          menu = {
                            items =
                              (map (item: {
                                inherit
                                  item
                                  ;
                                on = true;
                              }))
                                [
                                  "collection"
                                  "downloads"
                                  "wine-manager"
                                  "stores"
                                  "emulators"
                                  "statistics"
                                  "separator"
                                  "add-game"
                                  "customize"
                                  "settings"
                                  "separator"
                                  "desktop"
                                  "power"
                                ];
                            side = "right";
                            style = "sidebar";
                          };
                          name = "Stylix";
                          nav = {
                            aButton = "details";
                            startOn = "first";
                            wrap = false;
                          };
                          shelfLimit = 20;
                          shelves = [
                            {
                              kind = "recent";
                              on = true;
                              title = "";
                            }
                            {
                              kind = "favourites";
                              on = true;
                              title = "";
                            }
                            {
                              kind = "installed";
                              on = true;
                              title = "";
                            }
                            {
                              kind = "statuses";
                              on = true;
                              title = "";
                            }
                            {
                              kind = "added";
                              on = false;
                              title = "";
                            }
                            {
                              kind = "backlog-short";
                              on = false;
                              title = "";
                            }
                            {
                              kind = "random";
                              on = false;
                              title = "";
                            }
                            {
                              kind = "forgotten";
                              on = false;
                              title = "";
                            }
                          ];
                          tabs = [
                            {
                              layout = "carousel";
                              name = "Main";
                              source = "all";
                            }
                            {
                              layout = "grid";
                              name = "Grid";
                              source = "all";
                            }
                          ];
                          tiles = {
                            badges = "all";
                            corners = "soft";
                            focus = "glow";
                            greyUninstalled = true;
                            header = false;
                            shape = "portrait";
                            size = "l";
                            titles = "focused";
                          };
                          version = "0.1";
                        };
                      };
                    };
                  }
                )
              ];
            }
        );

        options = {
          programs.heronite = {
            enable = lib.mkEnableOption "Heronite launcher";

            package = lib.mkPackageOption pkgs "heronite" {
              nullable = true;
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];
        };
      };
  };
}
