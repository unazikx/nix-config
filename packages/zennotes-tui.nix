{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule (_final: {
  pname = "zennotes-tui";
  version = "0.17.1";

  src = fetchFromGitHub {
    owner = "zennotes";
    repo = "tui";
    tag = "v${_final.version}";
    hash = "sha256-PscDWiku6iO+UXGZDWFmyf+0ieU86GZfyGgK/RMCdFU=";
  };

  vendorHash = "sha256-sGHO+48ghb14bx0R8aT1lrYuG85h2MP7ZtIhwL/tzfY=";

  subPackages = [ "cmd/zn" ];

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
