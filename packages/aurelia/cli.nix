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
  version = "0.1.43";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia";
    tag = "v${_final.version}";
    hash = "sha256-4Qli+SJbj4RlECvxUktwfPwSWhA93wfzFLXe/I/1Kl8=";
  };

  cargoHash = "sha256-QO4OLlgK97SLxPqnn3utw/MTNHKMigewOQqr09yggQI=";

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
