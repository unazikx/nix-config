{
  ...
}:

{
  zen.programs.gui.mpv.bindings = {
    homeManager =
      {
        ...
      }:
      let
        withText = cmd: desc: ''${cmd}; show-text "${desc}"'';
      in
      {
        programs.mpv.bindings = {
          MBTN_RIGHT = "cycle pause";

          WHEEL_UP = "add volume 2";
          WHEEL_DOWN = "add volume -2";
          "Shift+Wheel_Up" = "add volume 5";
          "Shift+Wheel_Down" = "add volume -5";

          l = "seek 5";
          RIGHT = "seek 5";
          "Shift+l" = "seek 10";
          "Shift+RIGHT" = "seek 10";

          h = "seek -5";
          LEFT = "seek -5";
          "Shift+h" = "seek -10";
          "Shift+LEFT" = "seek -10";

          k = "add volume 2";
          UP = "add volume 2";
          "Shift+k" = "add volume 5";
          "Shift+UP" = "add volume 5";

          j = "add volume -2";
          Down = "add volume -2";
          "Shift+j" = "add volume -5";
          "Shift+DOWN" = "add volume -5";

          q = "quit";
          Q = "quit-watch-later";

          p = withText "cycle pause" "Paused";
          SPACE = withText "cycle pause" "Paused";

          m = withText "cycle mute" "Muted";
          o = "show-progress";

          f = "cycle fullscreen";
          ESC = "set fullscreen no";

          "G" = "script-binding quality_menu/video_formats_toggle";
          "Alt+G" = "script-binding quality_menu/audio_formats_toggle";
          "Ctrl+G" = "script-binding quality_menu/reload";
        };
      };
  };
}
