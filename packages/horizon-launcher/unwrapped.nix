{
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation (_final: {
  pname = "horizon-launcher-unwrapped";
  version = "0.2.16";

  src = fetchzip {
    url = "https://github.com/horizon-rust/horizon/releases/download/launcher%40${_final.version}/horizon-launcher-linux-x86_64.tar.gz";
    sha256 = "sha256-36U6FQighy8kjwwhhpCpyWA6yJPNYd3ltL0PpsoVEw0=";
  };

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 horizon-launcher $out/bin/horizon-launcher
    runHook postInstall
  '';
})
