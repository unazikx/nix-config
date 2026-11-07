{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   portproton-qt = {
  #     type = "gitlab";
  #     owner = "dark_siders";
  #     repo = "portprotonqt-nix";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #     inputs.flake-utils.follows = "flake-utils";
  #   };
  #   # keep-sorted end
  # };

  zen.games.portproton-qt = {
    description = ''
      laucnher for windows games/apps
    '';

    includes = [
      zen.custom.portproton-qt
    ];

    homeManagerNixos =
      {
        inputs',
        config,
        ...
      }:
      let
        cfg = config.programs.portproton-qt;
      in
      {
        programs.portproton-qt = {
          enable = true;
          package = inputs'.portproton-qt.packages.portprotonqt;

          settings = {
            PortProton.portdata_path = "${config.xdg.dataHome}/portproton-qt";

            Downloads = {
              disable_runtime_download = "False";
              economy_mode = "False";
              download_wine_to_steam = "False";
              auto_download_ppdb = "True";
              auto_appimage_updates = "True";
            };

            Application.version = cfg.package.version;

            Display = {
              fullscreen = "False";
              tray_menu_mode = "compact";
              auto_fullscreen_gamepad = "False";
              minimize_to_tray = "False";
              autostart_enabled = "False";
              start_minimized = "False";
            };

            Appearance = {
              theme = "classic";
              theme_variant = "auto";
              sounds_enabled = "True";
              card_width = 250;
              auto_card_width = 250;
              badge_view_mode = "detailed";
              hide_autoinstall_tab = "False";
              hide_control_hints = "False";
              crash_reports_enabled = "True";
              enable_theme_store = "False";
              theme_store_card_width = 350;
            };

            Time = {
              detail_level = "detailed";
            };

            Gamepad = {
              type = "auto";
            };

            Games = {
              sort_method = "last_launch";
              display_filter = "all";
              only_installed = "False";
              steam_account_id = "auto";
            };
          };
        };
      };
  };
}
