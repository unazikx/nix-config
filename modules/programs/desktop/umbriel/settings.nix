{
  zen,
  ...
}:

{
  zen.programs.desktop.umbriel.settings = {
    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        meta = zen.programs.desktop.umbriel.meta;
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        programs.umbriel.settings = {
          general = {
            xwayland = true;
            show_cheatsheet = false;
            focus_on_activate = false;
            honor_restored_maximize = false;
          };

          colors = {
            background = colors.base01;
            text_primary = colors.base05;
            text_muted = colors.base04;
            accent_primary = colors.base0E;
            accent_secondary = colors.base0B;
            warning = colors.base0A;
            error = colors.base08;

            insert_hint = colors.base02;
            backdrop = colors.base00;
            shadow = colors.base00;

            border = {
              focused = colors.base00; # when will be added dimming change to base00
              # not yet just testing
              unfocused = colors.base00;
              # scratchpad_focused = colors.base0C;
              # scratchpad_unfocused = colors.base00;
              outer = colors.base01;
            };

            overview = {
              background_tint = "${colors.base01}DD";
              workspace_background = "${colors.base00}CC";
              badge = colors.base0E;
            };
          };

          animation = {
            enabled = true;
            duration_ms = 250;
            curve = "snappy";

            windows_in = {
              enabled = true;
              duration_ms = 250;
              curve = "ease";
              style = "popin";
            };

            windows_out = {
              enabled = true;
              duration_ms = 250;
              curve = "easeout";
            };

            windows_move = {
              enabled = true;
              duration_ms = 250;
              curve = "linear";
            };

            workspaces = {
              enabled = true;
              duration_ms = 250;
              curve = "ease";
            };

            overview = {
              enabled = true;
              duration_ms = 250;
              curve = "ease";
            };

            dim_unfocused = {
              enabled = true;
              duration_ms = 250;
              curve = "linear";
            };

            layers = {
              enabled = true;
              duration_ms = 250;
              curve = "ease";
            };
          };

          appearance = {
            prefer_no_csd = true;
            border_width = 3;
            corner_radius = 12;
            drag_opacity = 0.75;

            blur = {
              enabled = true;
              optimized = true;
              passes = 3;
              radius = 3;
              noise = 0.02;
              brightness = 0.9;
              contrast = 0.9;
              saturation = 1.1;
            };

            shadow = {
              enabled = true;
              softness = 10;
              offset_x = 2;
              offset_y = 2;
            };
          };

          overview = {
            zoom = 0.75;
            background_blur = true;
            shortcuts = true;
            shortcut_keys = "asdfghjkl";
          };

          layout = {
            mode = "scrolling";
            gap = 8;

            extent_presets = [
              0.333
              0.5
              0.7
              0.9
              1
            ];

            struts = {
              left = 0;
              right = 0;
              top = 0;
              bottom = 0;
            };

            scrolling = {
              default_extent_fraction = 0.9;
              center_underfull_strip = true;
              center_focused = "on_overflow";
            };
          };

          input = {
            middle_click_paste = false;

            keyboard = {
              layout = "us,ru";
              variant = "";
              options = "grp:caps_toggle";
              repeat_rate = 25;
              repeat_delay = 600;
              numlock_toggle = true;
              track_layout = "global";
            };

            mouse = {
              natural_scroll = false;
              sensitivity = 0.0;
              scroll_wheel_step = 60;
            };

            cursor = {
              theme = "";
              size = 24;
              hardware_cursor = true;
              follows_focus = false;
              hide_when_typing = true;
              hide_timeout_ms = 1200;
            };

            focus = {
              follows_mouse = false;
            };
          };

          output =
            lib.genAttrs
              [
                "HDMI-A-1"
                "eDP-1"
              ]
              (_: {
                workspaces = meta.workspaceCount;
              });
        };
      };
  };
}
