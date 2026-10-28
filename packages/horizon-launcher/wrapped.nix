{
  buildFHSEnv,
  horizon-launcher,
  makeWrapper,
  makeDesktopItem,
  lib,
}:

buildFHSEnv (_final: {
  pname = "horizon-launcher";
  version = horizon-launcher.unwrapped.version;

  targetPkgs = _pkgs: [
    _pkgs.alsa-lib
    _pkgs.dbus
    _pkgs.fontconfig
    _pkgs.freetype
    _pkgs.libGL
    _pkgs.libx11
    _pkgs.libxcb
    _pkgs.libxcursor
    _pkgs.libxi
    _pkgs.libxkbcommon
    _pkgs.libxrandr
    _pkgs.openssl
    _pkgs.python3
    _pkgs.stdenv.cc.cc.lib
    _pkgs.temurin-jre-bin-25
    _pkgs.udev
    _pkgs.vulkan-loader
    _pkgs.wayland
    _pkgs.xdg-utils
    _pkgs.zlib
  ];

  nativeBuildInputs = [
    makeWrapper
  ];

  runScript = "${horizon-launcher.unwrapped}/bin/horizon-launcher";

  extraInstallCommands =
    # bash
    ''
      mv $out/bin/horizon-launcher $out/bin/.horizon-launcher-fhs

      makeWrapper $out/bin/.horizon-launcher-fhs $out/bin/horizon-launcher \
        --set HORIZON_LAUNCHER_NO_SELF_UPDATE 1 \
        --set HORIZON_LAUNCHER_DESKTOP_EXEC $out/bin/horizon-launcher

      mkdir -p $out/share/applications

      cp ${_final.desktopItem}/share/applications/* $out/share/applications/
    '';

  desktopItem = makeDesktopItem {
    name = "horizon-launcher";
    desktopName = "Horizon";
    comment = "Install and play Horizon";
    exec = "horizon-launcher";
    icon = "applications-games";
    categories = [ "Game" ];
    startupWMClass = "horizon-launcher";
  };

  meta = {
    description = "Launcher for Horizon, a Rust rewrite of Minecraft Java Edition";
    homepage = "https://github.com/horizon-rust/horizon";
    license = lib.licenses.mit;
  };
})
