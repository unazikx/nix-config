{
  appimageTools,
  fetchurl,
  lib,
}:

appimageTools.wrapAppImage (_final: {
  pname = "spotifast";
  version = "0.17.0";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/crmne/spotifast/releases/download/v${_final.version}/spotifast-${_final.version}-x86_64.AppImage";
      sha256 = "sha256-T5ZgHaUHiKo3UpA4JLFamJNr5J73DDpRmoLmgqdf5G4=";
    };
  };

  extraPkgs = _pkgs: [
    _pkgs.dbus
    _pkgs.libxkbcommon
    _pkgs.wayland
    _pkgs.libGL
    _pkgs.libx11
    _pkgs.libxcursor
    _pkgs.libxi
    _pkgs.libxrandr
  ];

  extraInstallCommands =
    # bash
    ''
      install -Dm444 ${_final.src}/spotifast.desktop -t $out/share/applications
      install -Dm444 ${_final.src}/spotifast.svg -t $out/share/icons
    '';

  meta = {
    description = "Fast native Spotify client with local playback and Spotify Connect";
    homepage = "https://spotifast.rocks";
    license = lib.licenses.mit;
    mainProgram = "spotifast";
  };
})
