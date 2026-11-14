{
  zen,
  ...
}:

{
  zen.programs.cli.ytsub = {
    description = ''
      subscribes viewer for youtube
      https://github.com/sarowish/ytsub#from-youtube--google-takeout
    '';

    includes = [
      zen.custom.ytsub
    ];

    wiki = {
      ytsub.links = [
        {
          name = "guide-for-importing";
          link = "https://github.com/sarowish/ytsub#importing-subscriptions";
          logo = "https://avatars.githubusercontent.com/u/20581722";
        }
        {
          name = "google-takeout";
          link = "https://takeout.google.com/takeout/custom/youtube";
          logo = "https://avatars.githubusercontent.com/u/20581722";
        }
      ];
    };

    homeManager =
      {
        ...
      }:
      {
        programs.ytsub = {
          enable = true;

          settings = {
            # keep-sorted start block=yes
            always_show_video_info = false;
            api = "local";
            chapters = true;
            hide_disabled_tabs = true;
            hide_members_only = false;
            hide_watched = false;
            highlight_symbol = "❯ ";
            mode = "subscriptions";
            mpv_path = "mpv";
            prefer_dash_formats = true;
            prefer_original_audio = true;
            prefer_original_titles = true;
            preferred_audio_codec = "webm";
            preferred_video_codec = "webm";
            refresh_on_launch = true;
            refresh_threshold = 600;
            request_timeout = 5;
            rss_threshold = 9999;
            show_thumbnails = true;
            subtitle_languages = [ "ru" ];
            tabs = [ "videos" ];
            tick_rate = 10;
            video_info_position = "bottom";
            video_player_for_stream_formats = "mpv";
            video_quality = "1080";
            vlc_path = "vlc";
            # keep-sorted end

            # keep-sorted start block=yes
            key_bindings = {
              "1" = "set_mode_subs";
              "2" = "set_mode_latest_videos";
              "j down" = "on_down";
              "k up" = "on_up";
              "h left" = "on_left";
              "l right" = "on_right";
              "g" = "select_first";
              "G" = "select_last";
              "L" = "next_tab";
              "H" = "previous_tab";
              "c" = "jump_to_channel";
              "t" = "toggle_hide";
              "i" = "subscribe";
              "d" = "unsubscribe";
              "D" = "delete_video";
              "/" = "search_forward";
              "?" = "search_backward";
              "n" = "repeat_last_search";
              "N" = "repeat_last_search_opposite";
              "s" = "switch_api";
              "r" = "refresh_channel";
              "R" = "refresh_channels";
              "J" = "load_more_videos";
              "F" = "refresh_failed_channels";
              "y" = "copy_youtube_link";
              "Y" = "copy_invidious_link";
              "o" = "open_in_youtube";
              "O" = "open_in_invidious";
              "p" = "play_from_formats";
              "P" = "play_using_ytdlp";
              "f" = "select_formats";
              "m" = "toggle_watched";
              "ctrl-h" = "toggle_help";
              "T" = "toggle_tag";
              "q ctrl-c" = "quit";
              help = {
                "ctrl-y" = "scroll_up";
                "ctrl-e" = "scroll_down";
                "g" = "go_to_top";
                "G" = "go_to_bottom";
                "escape" = "abort";
              };
              import = {
                "space" = "toggle_selection";
                "a" = "select_all";
                "z" = "deselect_all";
                "enter" = "import";
              };
              tag = {
                "i" = "create_tag";
                "d" = "delete_tag";
                "r" = "rename_tag";
                "s" = "select_channels";
                "space" = "toggle_selection";
                "a" = "select_all";
                "z" = "deselect_all";
                "escape" = "abort";
              };
              channel_selection = {
                "enter" = "confirm";
                "escape" = "abort";
                "space" = "toggle_selection";
                "a" = "select_all";
                "z" = "deselect_all";
              };
              format_selection = {
                "enter" = "play_video";
                "escape" = "abort";
                "space" = "select";
                "l right" = "next_tab";
                "h left" = "previous_tab";
                "s" = "switch_format_type";
              };
            };
            # keep-sorted end

            # keep-sorted start block=yes
            error = {
              fg = "Red";
            };
            focused = {
              fg = "Black";
              bg = "Yellow";
              modifiers = "bold";
            };
            focused_watched = {
              fg = "Black";
              bg = "Yellow";
              modifiers = "bold";
            };
            header = {
              fg = "White";
              modifiers = "bold";
            };
            help = {
              fg = "Red";
            };
            members_only_indicator = {
              fg = "Green";
              modifiers = "italic";
            };
            new_video_indicator = {
              fg = "Red";
              modifiers = "italic";
            };
            selected = {
              fg = "Black";
              bg = "White";
              modifiers = "bold";
            };
            selected_block = {
              fg = "White";
            };
            selected_watched = {
              fg = "Black";
              bg = "White";
              modifiers = "bold";
            };
            title = {
              fg = "White";
              modifiers = "bold";
            };
            video_info = {
              fg = "DarkGray";
            };
            warning = {
              fg = "Yellow";
            };
            watched = {
              fg = "DarkGray";
            };
            # keep-sorted end
          };
        };
      };
  };
}
