{
  ...
}:

{
  zen.programs.gui.nemo = {
    description = ''
      best gui file-manager

      to get nemo settings
      > dconf dump /org/nemo/
    '';

    homeManager =
      {
        pkgs,
        config,
        ...
      }:
      {
        home.packages = [
          pkgs.nemo-with-extensions
        ];

        dconf.settings = {
          "org/nemo/icon-view" = {
            default-zoom-level = "larger";
            labels-beside-icons = false;
          };

          "org/nemo/plugins" = {
            disabled-actions = [
              "90_new-launcher.nemo_action"
              "add-desklets.nemo_action"
              "change-background.nemo_action"
              "mount-archive.nemo_action"
              "set-as-background.nemo_action"
              "set-resolution.nemo_action"
            ];
          };

          "org/nemo/preferences" = {
            date-font-choice = "system-mono";
            date-format = "iso";
            inherit-folder-viewer = true;
            inherit-show-thumbnails = true;
            show-advanced-permissions = true;
            show-compact-view-icon-toolbar = false;
            show-computer-icon-toolbar = true;
            show-directory-item-counts = "always";
            show-full-path-titles = false;
            show-home-icon-toolbar = true;
            show-icon-view-icon-toolbar = false;
            show-image-thumbnails = "always";
            show-list-view-icon-toolbar = false;
            show-open-in-terminal-toolbar = true;
            show-reload-icon-toolbar = true;
            show-show-thumbnails-toolbar = true;
            show-up-icon-toolbar = false;
            thumbnail-limit = config.lib.gvariant.mkUint64 2147483648;
            tooltips-in-icon-view = false;
            tooltips-in-list-view = false;
            tooltips-show-birth-date = false;
            tooltips-show-file-type = false;
            tooltips-show-mod-date = false;
          };

          "org/nemo/window-state" = {
            sidebar-bookmark-breakpoint = 6;
            start-with-menu-bar = false;
            start-with-sidebar = true;
            start-with-status-bar = false;
          };
        };
      };
  };
}
