{
  ...
}:

{
  zen.miscellaneous.cleaner = {
    description = ''
      auto cleaner directories by timer
    '';

    homeManager =
      {
        config,
        ...
      }:
      {
        systemd.user.tmpfiles.rules =
          [
            # keep-sorted start
            "${config.xdg.cacheHome}/appimage-run"
            "${config.xdg.cacheHome}/electron"
            "${config.xdg.cacheHome}/helix"
            "${config.xdg.dataHome}/64Gram"
            "${config.xdg.dataHome}/PrismLauncher/cache"
            "${config.xdg.dataHome}/Trash"
            # keep-sorted end
          ]
          |> map (directory: "e ${directory} - - - 7d");
      };
  };
}
