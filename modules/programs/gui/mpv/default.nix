{
  zen,
  ...
}:

{
  zen.programs.gui.mpv = {
    description = ''
      best video player

      by default anime4k is enabled
    '';

    includes = [
      zen.programs.gui.mpv.anime4k
      zen.programs.gui.mpv.bindings
      zen.programs.gui.mpv.scripts
      zen.programs.gui.mpv.settings
      zen.programs.gui.mpv.theme
    ];

    homeManager =
      { ... }:
      {
        programs.mpv.enable = true;

        xdg.mimeApps.defaultApplications = {
          "application/x-cue" = "mpv.desktop";
          "audio/aac" = "mpv.desktop";
          "audio/flac" = "mpv.desktop";
          "audio/mp4" = "mpv.desktop";
          "audio/mpeg" = "mpv.desktop";
          "audio/ogg" = "mpv.desktop";
          "audio/opus" = "mpv.desktop";
          "audio/wav" = "mpv.desktop";
          "audio/webm" = "mpv.desktop";
          "audio/x-flac" = "mpv.desktop";
          "audio/x-m4a" = "mpv.desktop";
          "audio/x-mpegurl" = "mpv.desktop";
          "audio/x-wav" = "mpv.desktop";
          "video/mp2t" = "mpv.desktop";
          "video/mp4" = "mpv.desktop";
          "video/mpeg" = "mpv.desktop";
          "video/ogg" = "mpv.desktop";
          "video/quicktime" = "mpv.desktop";
          "video/webm" = "mpv.desktop";
          "video/x-m4v" = "mpv.desktop";
          "video/x-matroska" = "mpv.desktop";
          "video/x-msvideo" = "mpv.desktop";
        };

        stylix.targets = {
          mpv.enable = false;
        };
      };
  };
}
