{
  rustPlatform,
  fetchFromGitHub,
  cmake,
  perl,
  pkg-config,
  zlib,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "steam-tui";
  version = "0.4.6";

  src = fetchFromGitHub {
    owner = "vanyapoker";
    repo = "steam-tui";
    tag = "v${_final.version}";
    hash = "sha256-l03JUXkSm795R45O++ZzXnWMeOLGTaDuMseJQYmvdFs=";
  };

  cargoLock.lockFile = "${_final.src}/Cargo.lock";

  doCheck = false;

  nativeBuildInputs = [
    cmake
    perl
    pkg-config
  ];

  buildInputs = [
    perl
    zlib
  ];

  meta = {
    description = "TUI Steam launcher";
    homepage = "https://github.com/vanyapoker/steam-tui";
    license = lib.licenses.mit;
    mainProgram = "steam-tui";
  };
})
