{
  rustPlatform,
  fetchFromGitHub,
  bzip2,
  cmake,
  perl,
  pkg-config,
  xz,
  zstd,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "aurelia";
  version = "0.2.5";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_final.version}";
    hash = "sha256-52yt+5kJiXB81sJsYw2hrZy1esvIQDaPgCk3uoiLv0c=";
  };

  cargoHash = "sha256-cWq4dOkepOUQ54fCOxxVuzXUhmqWf3IWashuJowAbNA=";

  nativeBuildInputs = [
    cmake
    perl
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    bzip2
    xz
    zstd
  ];

  meta = {
    description = "Aurelia CLI Steam launcher";
    homepage = "https://github.com/Drackrath/Aurelia";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia";
  };
})
