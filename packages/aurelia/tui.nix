{
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "aurelia-tui";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia-TUI";
    rev = "v${_final.version}";
    hash = "sha256-fwKXnZfBJa0gk/d3InMagztNodcjkjPOUNyfhw3TExY=";
  };

  cargoHash = "sha256-HK4ICimMjaZI4yQAeYKXOOgURhhMIQpC/lyn3R0H0EE=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    openssl
  ];

  meta = {
    description = "Steam TUI Implementation of Aurelia CLI";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia-tui";
  };
})
