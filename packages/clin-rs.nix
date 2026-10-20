{
  appimageTools,
  fetchurl,
  lib,
}:

# appimage until not appeared in nixpkgs
appimageTools.wrapAppImage (_final: {
  pname = "clin-rs";
  version = "0.13.2";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/reekta92/clin-rs/releases/download/v${_final.version}/clin-rs-${_final.version}-x86_64.AppImage";
      sha256 = "sha256-If8sJXS/TXEQET6nmm6UQv4vUcMUpkVi8BZOSzR2Hbk=";
    };
  };

  extraPkgs = _pkgs: [
    # _pkgs.tesseract
    _pkgs.wl-clipboard
    # _pkgs.xclip
    _pkgs.markitdown
    _pkgs.curl
  ];

  meta = {
    description = "Note writer alike Obsidian";
    homepage = "https://github.com/reekta92/clin-rs";
    license = lib.licenses.gpl3Only;
    mainProgram = "clin-rs";
  };
})
