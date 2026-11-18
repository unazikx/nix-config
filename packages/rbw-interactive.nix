{
  rustPlatform,
  fetchFromGitHub,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "rbw-interactive";
  version = "git";

  src = fetchFromGitHub {
    owner = "Alpha1337k";
    repo = "rbw-interactive";
    rev = "aea413b5912ed60390c02360757c6446dc0e9271";
    hash = "sha256-nzD5INLKL2E+MIaadk8lpAlV3lDLF0BTcUPsoIkvy/0=";
  };

  cargoHash = "sha256-aHZ3pqOpGCwYXlu8bgssK8uzMRWocxy1rY2Qeksddck=";

  meta = {
    description = "Aurelia CLI Steam launcher";
    homepage = "https://github.com/Drackrath/Aurelia";
    license = lib.licenses.gpl3;
    mainProgram = "aurelia";
  };
})
