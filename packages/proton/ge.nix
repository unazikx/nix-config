{
  proton-ge-bin,
  writeShellScript,
  gamemode,
  mangohud,
  lib,
}:

let
  # https://github.com/barsikus007/config/commit/baaf620a4b8d35999ec9ac663de0987dd95b5a82
  dispatcher = writeShellScript "proton-dispatcher" ''
    DIR="$(dirname "$(readlink -f "$0")")"
    exec ${lib.getExe gamemode} ${lib.getExe mangohud} "$DIR/proton-real" "$@"
  '';
in

proton-ge-bin.overrideAttrs {
  pname = "proton-ge-bin-patched";

  dontUnpack = false;
  installPhase = ''
    runHook preInstall
    echo "proton-ge-bin should not be installed into environments." > $out
    mkdir $steamcompattool
    cp -r . $steamcompattool/
    runHook postInstall
  '';

  postInstall = ''
    mv $steamcompattool/proton $steamcompattool/proton-real
    cp ${dispatcher} $steamcompattool/proton
    chmod +x $steamcompattool/proton
  '';

  patches = [
    ./decrease-prefix-size.patch
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;
}
