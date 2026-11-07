{
  stdenv,
  fetchzip,
  autoPatchelfHook,
  glib,
  gtk4,
  libadwaita,
  makeWrapper,
  openssl,
  webkitgtk_6_0,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "penguin-mail";
  version = "1.0.12";

  src = fetchzip {
    url = "https://github.com/c9dev/penguin-mail/releases/download/v${_final.version}/penguin-mail-${_final.version}-x86_64.zip";
    sha256 = "sha256-kvIcj94ql1F2oMWPkEvnZtaQnmcoipxJF+kiBVxjVzs=";
  };

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  nativeBuildInputs = [
    makeWrapper
    autoPatchelfHook
  ];

  buildInputs = [
    glib
    gtk4
    libadwaita
    openssl
    webkitgtk_6_0
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r ./bin ./share $out/

    runHook postInstall
  '';

  meta = {
    description = "Penguin Mail";
    homepage = "https://github.com/c9dev/penguin-mail";
    license = lib.licenses.gpl3Only;
    mainProgram = "penguin-mail";
  };
})
