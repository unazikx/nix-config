{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   spotifast = {
  #     type = "github";
  #     owner = "crmne";
  #     repo = "spotifast";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.spotifast = {
    description = ''
      egui spotify client
      not electron, faster

      cause i use custom client id
      it stored in sops
      then goes to templates and then links

      but WHY SPOTIFAST OVERRIDES SETTINGS
    '';

    includes = [
      zen.custom.spotifast
    ];

    homeManagerNixos =
      {
        pkgs,
        # lib,
        # config,
        # host,
        # user,
        ...
      }:
      # let
      #   cfg = config.programs.spotifast;
      #   json = pkgs.formats.json { };
      # in
      {
        programs.spotifast = {
          enable = true;
          package = pkgs._master.spotifast;

          generate = false;

          # settings = {
          #   # keep-sorted start block=yes
          #   accent_from_art = false;
          #   art_expanded = false;
          #   audio_backend = null;
          #   audio_buffer_ms = 100;
          #   audio_cache = true;
          #   audio_cache_mb = 4096;
          #   audio_device = null;
          #   autoplay = true;
          #   balance = 0.0;
          #   bitrate = 320;
          #   check_for_updates = false;
          #   custom_titlebar = false;
          #   device_name =
          #     [
          #       host.hostName
          #       user.userName
          #     ]
          #     |> lib.concatStringsSep "@";
          #   download_updates_automatically = false;
          #   eq_shaded = false;
          #   gapless = true;
          #   home = {
          #     made_for_you = {
          #       visible = true;
          #     };
          #     recommendations = {
          #       visible = true;
          #     };
          #   };
          #   keep_playing_in_background = true;
          #   language = "system";
          #   library_by_you = false;
          #   library_sort = { };
          #   liked_songs_pinned = true;
          #   lyrics_width = 360.0;
          #   mac_notch_widget = false;
          #   middle_click_autoscroll = false;
          #   mono = false;
          #   normalisation = true;
          #   personal_app_intro_seen = true;
          #   personal_app_nudge_at = null;
          #   pinned_contexts = [
          #     "spotifast:liked-songs"
          #     "spotify:playlist:37i9dQZEVXbfc3SxVfYQIz"
          #     "spotify:playlist:37i9dQZEVXcPx0x1MaeSkE"
          #   ];
          #   playback_authorized = true;
          #   player_bar_vis = "off";
          #   player_bar_vis_click = false;
          #   playlist_height = 174;
          #   playlist_open = false;
          #   playlist_shaded = false;
          #   proxy_mode = "off";
          #   queue_width = 280.0;
          #   search_history = [ ];
          #   show_shortcut_hints = true;
          #   sidebar_compact = true;
          #   sidebar_grid = false;
          #   sidebar_order = [ ];
          #   sidebar_visible = true;
          #   sidebar_width = 210.0;
          #   skin = null;
          #   skin_scale = 3;
          #   theme = "stylix";
          #   tracklist_compact = false;
          #   vis = "bars";
          #   volume = 26214;
          #   web_client_id = config.sops.placeholder."programs/spotifast";
          #   winamp_on_top = false;
          #   winamp_shaded = false;
          #   winamp_show_taskbar = true;
          #   winamp_window = false;
          #   zoom = 1.2;
          #   # keep-sorted end
          # };
        };

        # xdg.configFile = {
        #   "spotifast/settings.json" = {
        #     source = config.lib.file.mkOutOfStoreSymlink config.sops.templates."spotifast-config".path;
        #     force = true;
        #   };
        # };

        # sops.secrets = {
        #   "programs/spotifast" = { };
        # };

        # sops.templates = {
        #   "spotifast-config".content = lib.readFile (json.generate "spotifast-config.json" cfg.settings);
        # };
      };
  };
}
