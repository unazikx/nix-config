{
  proton-ge-bin,
  fetchzip,
  lib,
}:

proton-ge-bin.overrideAttrs (
  _final: _prev: {
    steamDisplayName = "Proton CachyOS SLR";

    pname = "proton-cachyos-patched";
    version = "cachyos-11.0-20261015-slr";

    src = fetchzip {
      url = "https://github.com/CachyOS/proton-cachyos/releases/download/${_final.version}/proton-${_final.version}-x86_64_v3.tar.xz";
      sha256 = "sha256-USZ7wVV069xmGJdtyg6b/pdv7qqLkUkSZEyHiiVIs1o=";
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

    preFixup = ''
      substituteInPlace "$steamcompattool/compatibilitytool.vdf" \
        --replace-fail "proton-${_final.version}-x86_64" "${_final.steamDisplayName}"
    '';

    allowSubstitutes = false;
    preferLocalBuild = true;

    meta = {
      description = ''
        Compatibility tool for Steam Play based on Wine and additional components.
        This version is build against the Steam Linux Runtime (SLR).
      '';
      homepage = "https://github.com/CachyOS/proton-cachyos";
      license = lib.licenses.bsd3;
    };
  }
)
