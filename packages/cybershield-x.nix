{
  appimageTools,
  lib,
}:

appimageTools.wrapAppImage (_final: {
  pname = "cybershield-x";
  version = "2.0.1";

  src = appimageTools.extract {
    inherit (_final)
      pname
      version
      ;

    src = /home/nixzoid/shield.AppImage;
  };

  extraPkgs = _pkgs: [ ];

  extraInstallCommands =
    # bash
    ''
      # install -Dm444 ${_final.src}/VoxelCore.desktop -t $out/share/applications
      # install -Dm444 ${_final.src}/VoxelCore.png $out/share/icons
    '';

  meta = {
    description = "Lightweight Minecraft clone";
    homepage = "https://github.com/MihailRis/voxelcore";
    license = lib.licenses.mpl20;
    mainProgram = "voxel-core";
  };
})
