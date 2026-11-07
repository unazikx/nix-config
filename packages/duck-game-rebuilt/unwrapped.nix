{
  stdenv,
  fetchurl,
  unzip,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "duck-game-rebuilt-unwrapped";
  version = "1.4.8.4";

  src = fetchurl {
    url = "https://github.com/TheFlyingFoool/DuckGameRebuilt/releases/download/v${_final.version}/DuckGameRebuilt.zip";
    sha256 = "sha256-YwmRyhxwzauotsd0seQ/0/M5TUO82veXC5J0QFVmzv8=";
  };

  nativeBuildInputs = [
    unzip
  ];

  dontBuild = true;
  dontConfigure = true;
  dontStrip = true;

  unpackPhase = ''
    mkdir -p $out/bin
    unzip $src -d $out/bin
  '';

  installPhase = ''
    chmod +x $out/bin/DuckGame.sh
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Duck Game decompiled & rebuilt with some added features (unwrapped)";
    homepage = "https://github.com/TheFlyingFoool/DuckGameRebuilt";
    license = lib.licenses.unlicense;
    mainProgram = "DuckGame.sh";
  };
})
