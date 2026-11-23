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
        {
          name = "keybindings";
          link = "https://github.com/sarowish/ytsub/blob/master/example/config.toml#L64";
          logo = "https://avatars.githubusercontent.com/u/20581722";
        }
      ];
    };

    homeManager =
      {
        pkgs,
        lib,
        ...
      }:
      {
        programs.ytsub = {
          enable = true;

          settings = {
            video_info_position = "bottom";
            mpv_path = lib.getExe pkgs.mpv;

            subtitle_languages = [ "ru" ];
            video_quality = "1080";
            chapters = true;

            theme = {
              title = {
                fg = "Red";
                modifiers = "bold";
              };

              header = {
                fg = "White";
                modifiers = "bold";
              };

              selected = {
                fg = "White";
                modifiers = "bold";
              };

              focused = {
                bg = "Red";
                fg = "Black";
                modifiers = "bold";
              };

              watched = {
                fg = "Green";
              };

              selected_watched = { };
              focused_watched = { };

              progress_percentage = {
                fg = "Yellow";
                modifiers = "italic";
              };

              new_video_indicator = {
                fg = "Blue";
                modifiers = "italic";
              };

              members_only_indicator = {
                fg = "White";
                modifiers = "italic";
              };

              selected_block = {
                fg = "Red";
              };

              video_info = {
                fg = "White";
              };

              progress_bar = {
                fg = "Red";
              };

              progress_bar_unfilled = { };

              error = {
                fg = "Red";
              };

              warning = {
                fg = "Yellow";
              };

              help = {
                fg = "Green";
              };
            };
          };
        };
      };
  };
}
