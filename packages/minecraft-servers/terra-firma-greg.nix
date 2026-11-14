{
  stdenv,
  fetchzip,
  lib,
}:

stdenv.mkDerivation (_final: {
  pname = "terra-firma-greg";
  version = "0.13.18";

  src = fetchzip {
    url = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern/releases/download/${_final.version}/TerraFirmaGreg-Modern-${_final.version}-serverpack.zip";
    sha256 = "sha256-YJYpeKFgzePfbNEVMC2mhhn2d3UIwzW5ADOEpIp3/PA=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir $out

    # dont need ya
    rm -r forge-auto-install.txt \
      minecraft_server.jar \
      server.properties \
      server_starter.conf \
      start_server.bat \
      start_server.sh

    cp -r * $out
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Minecraft modpack TerraFirmaGreg (TerraFirmaCraft + GregTech + Create)";
    homepage = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern";
    license = lib.licenses.lgpl3Only;
  };
})
