{
  appimageTools,
  fetchurl,
  lib,
}:

appimageTools.wrapAppImage (_final: {
  pname = "picoforge";
  version = "0.9.0";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/librekeys/picoforge/releases/download/v${_final.version}/picoforge_${_final.version}_glibc-2.28_x86-64.AppImage";
      hash = "sha256-gcEvEpzw5VvJMvlNuXgSBKJauRnZTphe0WAnAU9mv/U=";
    };
  };

  extraPkgs = _pkgs: [
    _pkgs.pcsclite
    _pkgs.hidapi
    _pkgs.udev
    _pkgs.alsa-lib
    _pkgs.libxkbcommon
    _pkgs.wayland
    _pkgs.vulkan-loader
    _pkgs.libx11
    _pkgs.libxcb
  ];

  meta = {
    description = "Open source commissioning tool for Pico FIDO security keys";
    homepage = "https://github.com/librekeys/picoforge";
    license = lib.licenses.agpl3Only;
    mainProgram = "picoforge";
  };
})
