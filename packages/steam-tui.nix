{
  stdenv,
  fetchzip,
  autoPatchelfHook,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "steam-tui";
  version = "0.5.0";

  src = fetchzip {
    url = "https://github.com/vanyapoker/steam-tui/releases/download/v${_final.version}/steam-tui-x86_64-linux.tar.gz";
    sha256 = "sha256-PVYOFy30g6/HX1bafeC2LLZd2Z4HU3ziw3Vr+WIYZ7Q=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "TUI Steam launcher";
    homepage = "https://github.com/vanyapoker/steam-tui";
    license = lib.licenses.mit;
    mainProgram = "steam-tui";
  };
})
