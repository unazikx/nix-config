{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  openssl,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "aurelia-tui";
  version = "0.1.4";

  src = fetchurl {
    url = "https://github.com/Drackrath/Aurelia-TUI/releases/download/v${_final.version}/aurelia_tui_linux_x86_64";
    sha256 = "sha256-FFd+7dII7zJ6u7VNzB2GnPOm0Biwl0m+EN3ZRfdk8ZQ=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    openssl
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/aurelia-tui
    runHook postInstall
  '';

  meta = {
    description = "Steam TUI Implementation of Aurelia CLI";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia-tui";
  };
})
