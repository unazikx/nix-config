{
  fetchzip,
  autoPatchelfHook,
  alsa-lib,
  brotli,
  bzip2,
  dbus,
  expat,
  fontconfig,
  freetype,
  glib,
  jdk8,
  jdk21,
  jdk25,
  jdk17,
  krb5,
  libffi,
  libGL,
  libpng,
  libproxy,
  libpulseaudio,
  libx11,
  libxcb,
  libxcursor,
  libxext,
  libxfixes,
  libxi,
  libxinerama,
  libxkbcommon,
  libxrandr,
  libxrender,
  libxxf86vm,
  makeDesktopItem,
  makeWrapper,
  openal,
  openssl,
  pcre2,
  stdenv,
  systemd,
  udev,
  wayland,
  xcb-util-cursor,
  xdg-utils,
  zlib,
  zstd,
  java ? [
    jdk17
    jdk21
    jdk25
    jdk8
  ],
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "kenny-launcher";
  version = "9.6.1-dev-ubuntu-r1";

  src = fetchzip {
    url = "https://github.com/Tuxeodoman/kenny-launcher-ubuntu/releases/download/v${_final.version}-ubuntu-r1/kenny-launcher-${_final.version}-ubuntu-x86_64.tar.xz";
    hash = "sha256-xBMYPXiqXUwNXN4MRZa3iB7tp+g3QzfdjSr8gI26qAY=";
    stripRoot = false;
  };

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  nativeBuildInputs = [
    makeWrapper
    autoPatchelfHook
  ];

  buildInputs = [
    alsa-lib
    brotli
    bzip2
    dbus
    expat
    fontconfig
    freetype
    glib
    krb5
    libffi
    libGL
    libpng
    libproxy
    libpulseaudio
    libx11
    libxcb
    libxcursor
    libxext
    libxfixes
    libxi
    libxinerama
    libxkbcommon
    libxrandr
    libxrender
    libxxf86vm
    openal
    openssl
    pcre2
    stdenv.cc.cc.lib
    systemd
    udev
    wayland
    xcb-util-cursor
    zlib
    zstd
  ];

  preFixup = ''
    cp "$out/libexec/kenny-launcher/libnloader.so" "$TMPDIR/kenny-pinned-nloader.so"
  '';

  autoPatchelfIgnoreMissingDeps = true;

  installPhase = ''
    runHook preInstall

    APPDIR="$out/libexec/kenny-launcher"

    mkdir -p "$APPDIR" "$out/{bin,share}"

    for item in *; do
      case "$item" in
        java|KennyLauncher|kenny.install) continue ;;
      esac
      cp -a "$item" "$APPDIR/"
    done

    cp .KennyLauncher.bin "$APPDIR/KennyLauncher"
    chmod +x "$APPDIR/KennyLauncher"

    install -Dm444 ${_final.desktopItem}/share/applications/* $out/share/applications

    makeWrapper "$APPDIR/KennyLauncher" "$out/bin/kenny-launcher" \
      --set KENNY_EXTERNAL_UPDATES 1 \
      --set KENNY_JAVA_PATHS "${lib.makeSearchPath "bin/java" java}" \
      --set QT_PLUGIN_PATH "$app/plugins" \
      --set QML_IMPORT_PATH "$app/qml" \
      --set QML2_IMPORT_PATH "$app/qml" \
      --prefix LD_LIBRARY_PATH : \
        "/run/opengl-driver/lib:$APPDIR/lib:${lib.makeLibraryPath _final.buildInputs}" \
      --prefix PATH : "${
        lib.makeBinPath [
          xdg-utils
          jdk21
        ]
      }"

    runHook postInstall
  '';

  postPhases = [ "restorePinnedAgent" ];

  restorePinnedAgent =
    # bash
    ''
      cp "$TMPDIR/kenny-pinned-nloader.so" "$out/libexec/kenny-launcher/libnloader.so"
      cmp "$TMPDIR/kenny-pinned-nloader.so" "$out/libexec/kenny-launcher/libnloader.so"
    '';

  desktopItem = makeDesktopItem {
    name = "kenny-launcher";
    desktopName = "Kenny Launcher Dev";
    exec = "kenny-launcher %u";
    categories = [ "Game" ];
    mimeTypes = [ "x-scheme-handler/kenny" ];
    startupWMClass = "KennyLauncher";
  };

  meta = {
    description = "Russian fucking shit launcher";
    homepage = "https://github.com/ArtemBatsak/KennyLauncher";
    license = lib.licenses.unfree;
    mainProgram = "kenny-launcher";
  };
})
