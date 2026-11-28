{
  stdenv,
  fetchFromGitHub,
  lib,
}:

stdenv.mkDerivation {
  pname = "protonhax";
  version = "git";

  src = fetchFromGitHub {
    owner = "jcnils";
    repo = "protonhax";
    rev = "922a7bbade5a93232b3152cc20a7d8422db09c31";
    hash = "sha256-P6DVRz8YUF4JY2tiEVZx16FtK4i/rirRdKKZBslbJxU=";
  };

  installPhase = ''
    install -Dm755 protonhax $out/bin/protonhax
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Allows to launch other app in Proton";
    homepage = "https://github.com/jcnils/protonhax";
    license = lib.licenses.bsd3ClauseTso;
    mainProgram = "protonhax";
  };
}
