{
  ...
}:

{
  zen.miscellaneous.bookmarks = {
    homeManagerNixos =
      {
        config,
        host,
        ...
      }:
      {
        gtk.gtk3.bookmarks = map (dir: "file://${dir}") [
          "${host.flakeDir}"

          "${config.home.homeDirectory}/Documents"
          "${config.home.homeDirectory}/Music"
          "${config.home.homeDirectory}/Pictures"
          "${config.home.homeDirectory}/Videos"
          "${config.home.homeDirectory}/Downloads"

          "${config.xdg.dataHome}/Steam"
          "/media"
        ];
      };
  };
}
