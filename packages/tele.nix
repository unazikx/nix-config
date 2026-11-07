{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_final: {
  pname = "tele";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "sorokin-vladimir";
    repo = "tele";
    tag = "v${_final.version}";
    hash = "sha256-dGUlgPQqb506QNaSwsaES3uNBF8ypIDBuWidbQYGf8U=";
  };

  vendorHash = "sha256-eCWK0KmDdsZWMx4RIXyJ8chbG6wGfXTuS0jTF4eB02M=";

  subPackages = [ "cmd/tele" ];

  env = {
    CGO_ENABLED = "0";
  };

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "A terminal-native Telegram client built for keyboard-driven workflows";
    homepage = "https://github.com/sorokin-vladimir/tele";
    license = lib.licenses.gpl3Only;
    mainProgram = "tele";
  };
})
