{
  python3Packages,
  fetchurl,
  lib,
}:

python3Packages.buildPythonApplication {
  pname = "qbittorrent-pbkdf2";
  version = "git";

  src = fetchurl {
    url = "https://gist.githubusercontent.com/unazikx/b15a46944c43434fa1da828d19a15270/raw/b461e6a109f58709d84ab085a024d1ebba8fbca5/generator.py";
    sha256 = "sha256-DLQ7h8CvpRVj3y0ICPEGyh2FhY06HGS0mER6+BKRo8w=";
  };

  dontUnpack = true;
  format = "other";

  installPhase = ''
    install -Dm755 $src $out/bin/qbittorrent-pbkdf2-generator
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Generates a PBKDF2 hash for qBittorrent WebUI password.";
    homepage = "https://gist.github.com/hastinbe/8b8d247f17481cfc262a98d661bc0fd5";
    license = lib.licenses.mit;
    mainProgram = "qbittorrent-pbkdf2-generator";
  };
}
