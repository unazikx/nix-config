{
  stdenv,
  fetchurl,
  unzip,
  lib,
}:

stdenv.mkDerivation {
  name = "gost-fonts";
  version = "latest";

  srcs =
    let
      archive = "https://web.archive.org/web/20260513003902";
    in
    [
      (fetchurl {
        url = "${archive}/https://stroydocs.com/web/info/gost_fonts/files/GOST_type_A.zip";
        hash = "sha256-R6JxAeUi4JNUNdLqqebmg4Lc0QRf3OcaZU6gmC7gkYQ=";
      })

      (fetchurl {
        url = "${archive}/http://stroydocs.com/web/info/gost_fonts/files/GOST_type_B.zip";
        hash = "sha256-XLADDt2gW0wxaZbJJd/J7Y27hv8DkG9FZPDwJI79myg=";
      })

      (fetchurl {
        url = "${archive}/https://stroydocs.com/web/info/gost_fonts/files/isocpeur.zip";
        hash = "sha256-RbkrLkOySqICXuB/BkW+EbVckm8tYbUrPztiYU5G9bI=";
      })
    ];

  dontBuild = true;

  unpackPhase = ''
    for src in $srcs; do
      ${lib.getExe unzip} -j $src
    done
  '';

  installPhase = ''
    install -d $out/share/fonts/gost
    install -m655 *.ttf $out/share/fonts/gost
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Russian engineering fonts";
    homepage = "https://stroydocs.com/info/gost_fonts";
    license = {
      tag = "custom";
      shortName = "copyright";
      fullName = "Copyright (C) All rights reserved";
      url = "https://en.wikipedia.org/w/index.php?title=All_rights_reserved";
      free = false;
    };
  };
}
