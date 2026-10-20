{
  rustPlatform,
  fetchFromGitHub,
  libdisplay-info,
  libdisplay-info_0_3,
  libdrm,
  libgbm,
  libglvnd,
  libinput,
  libx11,
  libxcb,
  libxcursor,
  libxi,
  libxkbcommon,
  libxrandr,
  pixman,
  pkg-config,
  seatd,
  systemd,
  wayland,
  wayland-protocols,
  lib,
}:

rustPlatform.buildRustPackage (_final: {
  pname = "driftwm";
  version = "0.19.0";

  src = fetchFromGitHub {
    owner = "malbiruk";
    repo = "driftwm";
    tag = "v${_final.version}";
    hash = "sha256-c/FGLGvP/7M+n41j85IA5OzqKBzzQ532eT7r61HCJJs=";
  };

  cargoHash = "sha256-rtSccFKbikMyeP1lT3Z1921/aKkws27apps2nZ7r6tE=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs =
    let
      _libdisplay = _pkgs: _pkgs.libdisplay-info_0_3 or _pkgs.libdisplay-info;
    in
    [
      (_libdisplay {
        inherit
          libdisplay-info_0_3
          libdisplay-info
          ;
      })
      libdrm
      libgbm
      libglvnd
      libinput
      libx11
      libxcb
      libxcursor
      libxi
      libxkbcommon
      libxrandr
      pixman
      seatd
      systemd
      wayland
      wayland-protocols
    ];

  doCheck = false;

  postFixup = ''
    patchelf --add-rpath "${lib.makeLibraryPath _final.buildInputs}" $out/bin/driftwm
  '';

  postInstall = ''
    install -Dm755 resources/driftwm-session $out/bin/driftwm-session
    install -Dm644 resources/driftwm.desktop $out/share/wayland-sessions/driftwm.desktop
    install -Dm644 resources/driftwm-portals.conf $out/share/xdg-desktop-portal/driftwm-portals.conf
    install -Dm644 resources/driftwm.service $out/lib/systemd/user/driftwm.service
    install -Dm644 resources/driftwm-shutdown.target $out/lib/systemd/user/driftwm-shutdown.target
    install -Dm644 config.reference.toml $out/etc/driftwm/config.reference.toml
    for f in extras/wallpapers/*.glsl; do
      install -Dm644 "$f" "$out/share/driftwm/wallpapers/$(basename "$f")"
    done

    substituteInPlace $out/share/wayland-sessions/driftwm.desktop --replace-fail "Exec=driftwm-session" "Exec=$out/bin/driftwm-session"

    substituteInPlace $out/lib/systemd/user/driftwm.service --replace-fail "ExecStart=driftwm" "ExecStart=$out/bin/driftwm"
  '';

  meta = {
    description = "A trackpad-first infinite canvas Wayland compositor";
    homepage = "https://github.com/malbiruk/driftwm";
    license = lib.licenses.gpl3Plus;
    mainProgram = "driftwm";
  };
})
