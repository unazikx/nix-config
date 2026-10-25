{
  appimageTools,
  fetchurl,
  lib,
}:

appimageTools.wrapAppImage (_final: {
  pname = "kurobayomi";
  version = "0.2.2";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/kurobayomi/kurobayomi/releases/download/v${_final.version}/Kurobayomi-x86_64.AppImage";
      sha256 = "sha256-N1ln7VS9Gsyn/g127nASus+SxXBIQ0SrHa7RMWsqgjg=";
    };
  };

  extraPkgs = _pkgs: [
    _pkgs.mpv
  ];

  meta = {
    description = "Mihon based manga/anime reader";
    homepage = "https://github.com/kurobayomi/kurobayomi";
    license = lib.licenses.asl20;
    mainProgram = "kurobayomi";
  };
})
