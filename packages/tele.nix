{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_final: {
  pname = "tele";
  version = "2.1.3";

  src = fetchFromGitHub {
    owner = "sorokin-vladimir";
    repo = "tele";
    tag = "v${_final.version}";
    hash = "sha256-gt5RiIL3c4UVNGZv9lKIQjKsTRlG999RzaTahkTmZCY=";
  };

  vendorHash = "sha256-LlqzasfGBLoE36Jl7EygkL/0zzeTUJsEM3FB07jqtW8=";

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
