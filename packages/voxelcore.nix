{
  appimageTools,
  fetchurl,
  lib,
}:

appimageTools.wrapAppImage (_final: {
  pname = "voxel-core";
  version = "0.32.0";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = fetchurl {
      url = "https://github.com/MihailRis/voxelcore/releases/download/v${_final.version}/voxelcore-${_final.version}_x86-64.AppImage";
      sha256 = "sha256-gbxw6zN5zsCtKFsEYM0qeG6MlmgLX2mFJfcVjmY+xes=";
    };
  };

  extraPkgs = pkgs: [
    pkgs.glm
    pkgs.glfw
    pkgs.glew
    pkgs.zlib
    pkgs.libpng
    pkgs.freetype
    pkgs.libvorbis
    pkgs.openal
    pkgs.luajit
    pkgs.curl
    pkgs.openssl
    pkgs.entt
    pkgs.mesa
    pkgs.freeglut
  ];

  extraInstallCommands =
    # bash
    ''
      install -Dm444 ${_final.src}/VoxelCore.desktop -t $out/share/applications
      install -Dm444 ${_final.src}/VoxelCore.png $out/share/icons
    '';

  meta = {
    description = "Lightweight Minecraft clone";
    homepage = "https://github.com/MihailRis/voxelcore";
    license = lib.licenses.mpl20;
    mainProgram = "voxel-core";
  };
})
