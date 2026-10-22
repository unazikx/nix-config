{
  zen,
  ...
}:

{
  zen.programs.desktop.umbriel.binds = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        meta = zen.programs.desktop.umbriel.meta;
        noctalia = config.programs.noctalia;

        norepeat = action: {
          inherit
            action
            ;
          repeat = false;
        };

        cooldown = action: cooldown_ms: {
          inherit
            action
            cooldown_ms
            ;
        };
      in
      {
        programs.umbriel.settings = {
          general.mod_key = "Super";

          keybinds = lib.mkMerge [
            (
              (
                {
                  "Q" = "window-close";
                  "Grave" = "session-quit";

                  "MouseMiddle" = "layout-scroll-drag";
                  "WheelUp" = cooldown "workspace-previous" 150;
                  "WheelDown" = cooldown "workspace-next" 150;

                  "Space" = norepeat "overview-toggle";
                  "Shift+Space" = norepeat "column-center";

                  "T" = "window-toggle-floating";
                  "P" = "window-toggle-pinned";

                  "F" = norepeat "window-toggle-fullscreen";
                  "Shift+F" = norepeat "window-toggle-maximize";

                  "Shift+Next" = "window-move-to-workspace-next";
                  "Shift+Prior" = "window-move-to-workspace-previous";
                  "Shift+Down" = "window-move-to-workspace-next";
                  "Shift+Up" = "window-move-to-workspace-previous";

                  "J" = "workspace-next";
                  "K" = "workspace-previous";
                  "Down" = "workspace-next";
                  "Up" = "workspace-previous";

                  "L" = "window-focus-next";
                  "H" = "window-focus-previous";
                  "Right" = "window-focus-next";
                  "Left" = "window-focus-previous";

                  "Shift+L" = "window-swap-next";
                  "Shift+H" = "window-swap-previous";
                  "Shift+Right" = "window-swap-next";
                  "Shift+Left" = "window-swap-previous";

                  "Minus" = "window-modify-primary-extent:-0.1";
                  "Equal" = "window-modify-primary-extent:+0.1";
                  "Shift+Minus" = "window-modify-secondary-extent:-0.1";
                  "Shift+Equal" = "window-modify-secondary-extent:+0.1";

                  "R" = norepeat "window-cycle-primary-extent";
                  "Shift+R" = norepeat "window-cycle-secondary-extent";
                }
                // (lib.genAttrs (map (n: toString n) (lib.range 1 meta.workspaceCount)) (
                  n: "workspace-switch:${n}"
                ))
                // (lib.listToAttrs (
                  map (n: {
                    name = "Shift+${toString n}";
                    value = "window-move-to-workspace:${toString n}";
                  }) (lib.range 1 meta.workspaceCount)
                ))
              )
              |> lib.concatMapAttrs (
                key: command: {
                  "Mod+${key}" = command;
                }
              )
            )

            (
              {
                "Return" = "footclient";
              }
              |> lib.concatMapAttrs (
                key: command: {
                  "Mod+${key}" = "spawn:${command}";
                }
              )
            )

            # noctalia integration
            # ^^^ https://docs.noctalia.dev/umbriel/keybinds/?section=example-noctalia-shell-integration#example-noctalia-shell-integration
            (lib.mkIf noctalia.enable (
              {
                "Print" = "screenshot-region";
                "Shift+Print" = "screenshot-fullscreen";
                "Alt+Print" = "screenshot-annotate";

                "Mod+Tab" = "panel-toggle launcher";
                "Mod+Alt+Space" = "dock-toggle";

                "Mod+A" = "annotate";
                "Mod+Shift+A" = "caffeine-toggle ";

                "Mod+W" = "window-switcher";

                "Mod+Z" = "panel-toggle clipboard";
                "Mod+Shift+Z" = "panel-toggle launcher /emo";

                "Mod+Backspace" = "session lock";
                "Mod+Escape" = "panel-toggle session";
              }
              |> lib.concatMapAttrs (
                key: command: {
                  "${key}" = norepeat "spawn:noctalia msg ${command}";
                }
              )
            ))
          ];

          hot_corners = {
            bottom_left = {
              enabled = true;
              delay_ms = 500;
              action = "overview-open";
            };
          };
        };
      };
  };
}
