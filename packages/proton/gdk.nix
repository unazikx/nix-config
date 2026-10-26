{
  proton-ge-bin,
  fetchzip,
  lib,
}:

proton-ge-bin.overrideAttrs (
  _final: _prev: {
    steamDisplayName = "Proton GDK";

    pname = "proton-gdk-patched";
    version = "release-11-7";

    src = fetchzip {
      url = "https://github.com/LukasPAH/GDK-Proton-Custom/releases/download/${_final.version}/GDK-Proton${_final.version}-x86_64.tar.gz";
      sha256 = "sha256-+K3u9LsgEfwhfvIQjHa09mvtUe1LHMQ/yG3vICXpvpU=";
    };

    dontUnpack = false;
    installPhase = ''
      runHook preInstall
      echo "proton-ge-bin should not be installed into environments." > $out
      mkdir $steamcompattool
      cp -r . $steamcompattool/
      runHook postInstall
    '';

    patches = [
      ./decrease-prefix-size.patch
    ];

    allowSubstitutes = false;
    preferLocalBuild = true;

    meta = {
      description = "Patched ProtonGDK for Microsoft games required Xbox services";
      homepage = "https://github.com/LukasPAH/GDK-Proton-Custom";
      license = lib.licenses.bsd3;
    };
  }
)
