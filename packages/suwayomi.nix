{
  suwayomi-server,
  fetchurl,
  temurin-jre-bin-21,
}:

(suwayomi-server.override {
  jdk21_headless = temurin-jre-bin-21;
}).overrideAttrs
  (
    _final: _prev: {
      version = "2.4.2366";

      src = fetchurl {
        url = "https://github.com/Suwayomi/Suwayomi-Server/releases/download/v${_final.version}/Suwayomi-Server-v${_final.version}.jar";
        hash = "sha256-r5/rIK+dfr6eMHaebG68f8erHERziNQuAoCx2l/ge/0=";
      };
    }
  )
