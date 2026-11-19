{
  zen,
  ...
}:

{
  zen.games.gale = {
    description = ''
      thunderstore helper
      with launcher to steam
      and pretty ui ye
    '';

    includes = [
      zen.custom.gale
    ];

    homeManager =
      {
        ...
      }:
      {
        programs.gale = {
          enable = true;
        };

        xdg.mimeApps = {
          defaultApplications = {
            "x-scheme-handler/gale" = "Gale.desktop";
            "x-scheme-handler/ror2mm" = "Gale.desktop";
          };
        };
      };
  };
}
