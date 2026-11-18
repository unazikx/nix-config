{
  rbw,
  fetchFromGitHub,
  lib,
}:

rbw.overrideAttrs (_final: {
  version = "git";

  src = fetchFromGitHub {
    owner = "rylos";
    repo = "rbw";
    rev = "6fcace22ca61ded8d6680088a4b0ebbbf8eed141";
    hash = "sha256-ppZg0DZkoftGXhCSEoM3t+UPYeBXCTZDwfHN5N50lS0=";
  };

  cargoHash = "sha256-Egq+gR7HfBrL26UBY8dXj5eAW0Gj9RqoW+LtW0nQWUE=";

  postInstall = ''
    install -Dm 0644 contrib/polkit/net.rbw.unlock.policy \
      -t $out/share/polkit-1/actions
  '';

  meta = {
    description = "Unofficial Bitwarden CLI — enhanced fork";
    homepage = "https://github.com/rylos/rbw";
    license = lib.licenses.mit;
    mainProgram = "rbw";
  };
})
