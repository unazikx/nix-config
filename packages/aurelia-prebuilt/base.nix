{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  bzip2,
  dbus,
  xz,
  zstd,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "aurelia";
  version = "0.2.5";

  src = fetchurl {
    url = "https://github.com/Drackrath/Aurelia/releases/download/v${_final.version}/aurelia_linux_x86_64";
    sha256 = "sha256-Fos4iU0iWjoBTRJhgFZryhFQnfJshbS9WhAwdFcmLWE=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    bzip2
    dbus
    stdenv.cc.cc.lib
    xz
    zstd
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/aurelia
    runHook postInstall
  '';

  meta = {
    description = "A fast, lightweight, command-line Steam launcher and library manager written in Rust";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia";
  };
})
