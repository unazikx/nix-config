{
  zen,
  ...
}:

{
  zen.programs.gui.davinci-resolve = {
    description = ''
      best video editor with color control

      it will be very very long (6~ gb for 20.0)
      kdenlive is shit

      list of patches:
      https://rutracker.org/forum/viewtopic.php?t=6088055
    '';

    includes = [
      zen.custom.davinci-resolve
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.davinci-resolve;
      in
      {
        programs.davinci-resolve = {
          enable = true;

          package = pkgs.davinci-resolve-studio;
          cracked = true;

          patches = [
            ''s/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/''
            ''s/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/''
            ''s/\x41\xb6\x01\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/\x41\xb6\x00\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/''
          ];

          extraLines =
            # bash
            ''
              echo -e "LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\nhostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\nakey=0000-0000-0000-0000 _ck=00 sig=\"00\"" > $out/.license/blackmagic.lic
            '';
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
