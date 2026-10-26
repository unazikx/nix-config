{
  ...
}:

{
  zen.games.gamemode = {
    description = ''
      optimizer for games
    '';

    nixos =
      {
        ...
      }:
      {
        programs.gamemode = {
          enable = true;
          enableRenice = true;

          # settings = {
          #   custom = {
          #     start = "${lib.getExe pkgs.libnotify} 'GameMode started'";
          #     end = "${lib.getExe pkgs.libnotify} 'GameMode stopped'";
          #   };
          # };
        };
      };
  };
}
