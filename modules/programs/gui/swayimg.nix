{
  ...
}:

{
  zen.programs.gui.swayimg = {
    description = ''
      best image viewer
      with gallery vies
      glitches on niri?
    '';

    homeManager =
      {
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
        fonts = config.stylix.fonts;
      in
      {
        programs.swayimg = {
          enable = true;

          initLua =
            # lua
            ''
              -- Settings --
              -- keep-sorted start
              swayimg.enable_antialiasing(true)
              swayimg.enable_decoration(false)
              swayimg.enable_exif_orientation(true)
              swayimg.enable_overlay(false)
              swayimg.gallery.enable_embedded_thumb(true)
              swayimg.gallery.enable_hover(true)
              swayimg.gallery.enable_preload(true)
              swayimg.gallery.enable_pstore(false)
              swayimg.gallery.limit_cache(100)
              swayimg.gallery.set_aspect("fit")
              swayimg.gallery.set_border_color(0xff${colors.base04})
              swayimg.gallery.set_border_size(6)
              swayimg.gallery.set_padding_size(18)
              swayimg.gallery.set_pinch_factor(100.0)
              swayimg.gallery.set_selected_color(0xff${colors.base01})
              swayimg.gallery.set_selected_scale(1.4)
              swayimg.gallery.set_thumb_size(200)
              swayimg.gallery.set_unselected_color(0xff${colors.base00})
              swayimg.gallery.set_window_color(0xff${colors.base00})
              swayimg.imagelist.enable_adjacent(true)
              swayimg.imagelist.enable_fsmon(true)
              swayimg.imagelist.enable_recursive(false)
              swayimg.imagelist.enable_reverse(false)
              swayimg.imagelist.set_order("numeric")
              swayimg.set_dnd_button("MouseRight")
              swayimg.set_mode("viewer")
              swayimg.slideshow.limit_history(0)
              swayimg.slideshow.set_default_scale("fit")
              swayimg.slideshow.set_timeout(5)
              swayimg.slideshow.set_window_background("auto")
              swayimg.text.set_background(0xff${colors.base00})
              swayimg.text.set_font("${fonts.sansSerif.name}")
              swayimg.text.set_foreground(0xff${colors.base06})
              swayimg.text.set_padding(14)
              swayimg.text.set_shadow(0xa0${colors.base00})
              swayimg.text.set_size(${toString (fonts.sizes.applications + 4)})
              swayimg.text.set_spacing(12)
              swayimg.text.set_status_timeout(3)
              swayimg.text.set_timeout(5)
              swayimg.viewer.enable_centering(true)
              swayimg.viewer.enable_loop(false)
              swayimg.viewer.limit_history(1)
              swayimg.viewer.limit_preload(3)
              swayimg.viewer.set_default_position("center")
              swayimg.viewer.set_default_scale("fit")
              swayimg.viewer.set_drag_button("MouseLeft")
              swayimg.viewer.set_image_chessboard(20, 0xff${colors.base00}, 0xff${colors.base01})
              swayimg.viewer.set_mark_color(0xff${colors.base0B})
              swayimg.viewer.set_pinch_factor(1.0)
              swayimg.viewer.set_window_background(0xff${colors.base00})
              -- keep-sorted end

              -- Viewer --
              swayimg.viewer.set_text("topleft", {
                "File:\t{name}",
                "Format:\t{format}",
              })

              swayimg.viewer.set_text("topright", {
                "Size:\t{frame.width}x{frame.height}",
                "File size:\t{sizehr}",
              })

              swayimg.viewer.set_text("bottomleft", {
                "Scale:\t{scale}",
              })

              swayimg.viewer.set_text("bottomright", {
                "Size:\t{frame.width}x{frame.height}",
                "File size:\t{sizehr}",
              })

              swayimg.viewer.on_key("Escape", function()
                swayimg.exit()
              end)

              swayimg.viewer.on_key("q", function()
                swayimg.exit()
              end)

              swayimg.viewer.on_key("Space", function()
                swayimg.set_mode("gallery")
              end)

              swayimg.viewer.on_key("t", function()
                if swayimg.text.visible() then
                  swayimg.text.hide()
                else
                  swayimg.text.show()
                end
              end)

              swayimg.viewer.on_key("m", function()
                swayimg.viewer.mark_image()
              end)

              swayimg.viewer.on_key("Delete", function()
                local img = swayimg.viewer.get_image()
                if img then
                  swayimg.imagelist.remove(img.path)
                end
              end)

              swayimg.viewer.on_key("d", function()
                local img = swayimg.viewer.get_image()
                if img then
                  swayimg.imagelist.remove(img.path)
                end
              end)

              swayimg.viewer.on_key("f", function()
                swayimg.set_fullscreen()
              end)

              swayimg.viewer.on_key("a", function()
                swayimg.enable_antialiasing()
              end)

              swayimg.viewer.on_key("Shift-r", function()
                swayimg.viewer.rotate(90)
              end)

              swayimg.viewer.on_key("r", function()
                swayimg.viewer.rotate(270)
              end)

              swayimg.viewer.on_key("Shift+e", function()
                swayimg.viewer.flip_horizontal()
              end)

              swayimg.viewer.on_key("e", function()
                swayimg.viewer.flip_vertical()
              end)

              swayimg.viewer.on_key("Backspace", function()
                swayimg.viewer.set_fix_scale("fit")
              end)

              swayimg.viewer.on_key("equal", function()
                local scale = swayimg.viewer.get_scale()
                swayimg.viewer.set_abs_scale(scale + scale / 10)
              end)

              swayimg.viewer.on_key("minus", function()
                local scale = swayimg.viewer.get_scale()
                swayimg.viewer.set_abs_scale(scale - scale / 10)
              end)

              swayimg.viewer.on_key("left", function()
                local pos = swayimg.viewer.get_position()
                swayimg.viewer.set_abs_position(pos.x + 10, pos.y)
              end)

              swayimg.viewer.on_key("down", function()
                local pos = swayimg.viewer.get_position()
                swayimg.viewer.set_abs_position(pos.x, pos.y - 10)
              end)

              swayimg.viewer.on_key("up", function()
                local pos = swayimg.viewer.get_position()
                swayimg.viewer.set_abs_position(pos.x, pos.y + 10)
              end)

              swayimg.viewer.on_key("right", function()
                local pos = swayimg.viewer.get_position()
                swayimg.viewer.set_abs_position(pos.x - 10, pos.y)
              end)

              swayimg.viewer.on_key("next", function()
                swayimg.viewer.open("next")
              end)

              swayimg.viewer.on_key("prior", function()
                swayimg.viewer.open("prev")
              end)

              -- Gallery --
              swayimg.gallery.set_text("topleft", {
                "File:\t{name}",
              })

              swayimg.gallery.set_text("topright", {
                "{list.index} of {list.total}",
              })

              swayimg.gallery.on_key("Escape", function()
                swayimg.exit()
              end)

              swayimg.gallery.on_key("q", function()
                swayimg.exit()
              end)

              swayimg.gallery.on_key("Space", function()
                swayimg.set_mode("viewer")
              end)

              swayimg.gallery.on_key("t", function()
                if swayimg.text.visible() then
                  swayimg.text.hide()
                else
                  swayimg.text.show()
                end
              end)

              swayimg.gallery.on_key("m", function()
                swayimg.gallery.mark_image()
              end)

              swayimg.gallery.on_key("d", function()
                local img = swayimg.gallery.get_image()
                if img then
                  swayimg.imagelist.remove(img.path)
                end
              end)

              swayimg.gallery.on_key("f", function()
                swayimg.set_fullscreen()
              end)

              swayimg.gallery.on_key("a", function()
                swayimg.enable_antialiasing()
              end)

              swayimg.viewer.on_key("Backspace", function()
                swayimg.viewer.set_fix_scale("fit")
              end)

              swayimg.gallery.on_key("equal", function()
                local size = swayimg.gallery.get_thumb_size()
                swayimg.gallery.set_thumb_size(size + 10)
              end)

              swayimg.gallery.on_key("minus", function()
                local size = swayimg.gallery.get_thumb_size()
                swayimg.gallery.set_thumb_size(size - 10)
              end)

              swayimg.gallery.on_key("up", function()
                swayimg.gallery.switch_image("up")
              end)

              swayimg.gallery.on_key("down", function()
                swayimg.gallery.switch_image("down")
              end)

              swayimg.gallery.on_key("left", function()
                swayimg.gallery.switch_image("left")
              end)

              swayimg.gallery.on_key("right", function()
                swayimg.gallery.switch_image("right")
              end)

              swayimg.gallery.on_key("next", function()
                swayimg.gallery.switch_image("pgdown")
              end)

              swayimg.gallery.on_key("prior", function()
                swayimg.gallery.switch_image("pgup")
              end)
            '';
        };

        xdg.mimeApps.defaultApplications = {
          "image/avif" = "swayimg.desktop";
          "image/bmp" = "swayimg.desktop";
          "image/gif" = "swayimg.desktop";
          "image/heif" = "swayimg.desktop";
          "image/jpeg" = "swayimg.desktop";
          "image/jpg" = "swayimg.desktop";
          "image/jxl" = "swayimg.desktop";
          "image/pbm" = "swayimg.desktop";
          "image/pjpeg" = "swayimg.desktop";
          "image/png" = "swayimg.desktop";
          "image/svg+xml" = "swayimg.desktop";
          "image/tiff" = "swayimg.desktop";
          "image/webp" = "swayimg.desktop";
          "image/x-bmp" = "swayimg.desktop";
          "image/x-exr" = "swayimg.desktop";
          "image/x-png" = "swayimg.desktop";
          "image/x-portable-anymap" = "swayimg.desktop";
          "image/x-portable-bitmap" = "swayimg.desktop";
          "image/x-portable-graymap" = "swayimg.desktop";
          "image/x-portable-pixmap" = "swayimg.desktop";
          "image/x-targa" = "swayimg.desktop";
          "image/x-tga" = "swayimg.desktop";
        };
      };
  };
}
