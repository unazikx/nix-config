{
  appimageTools,
  fetchurl,
  lib,

  withGOG ? true,
  withEGS ? true,
}:

appimageTools.wrapAppImage (_final: {
  pname = "heronite";
  version = "1.7.0";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/RafaelGoulartB/Heronite/releases/download/v${_final.version}/Heronite-x86_64.AppImage";
      hash = "sha256-3wOBR33Wx/g2cff92JKZF6lDLC6qDG/o/B/cGziv4Vc=";
    };
  };

  extraPkgs =
    _pkgs:
    [
      _pkgs.pcsclite
      _pkgs.hidapi
      _pkgs.udev
      _pkgs.alsa-lib
      _pkgs.libxkbcommon
      _pkgs.wayland
      _pkgs.vulkan-loader
      _pkgs.libx11
      _pkgs.libxcb
    ]
    ++ (lib.optional withEGS _pkgs.legendary-gl)
    ++ (lib.optional withGOG _pkgs.gogdl);

  extraInstallCommands =
    # bash
    ''
      install -Dm444 ${_final.src}/app.heronite.Heronite.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/app.heronite.Heronite.desktop \
        --replace-fail 'Exec=heronite-rs' 'Exec=heronite'

      cp -r ${_final.src}/usr/share/icons $out/share
    '';

  meta = {
    description = "Beautiful game launcher for Linux";
    homepage = "https://github.com/RafaelGoulartB/Heronite";
    license = lib.licenses.agpl3Only;
    mainProgram = "heronite";
  };
})
