{
  python3Packages,
  fetchFromGitHub,
  lib,
}:

python3Packages.buildPythonPackage (_final: {
  pname = "wayswitch";
  version = "2.0.0a4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Wetoshkin";
    repo = "WaySwitch";
    tag = "v${_final.version}";
    hash = "sha256-menuOYHW9Vz9jBfEoZcaTuLak7OZiS2aWDPQ/90WQUI=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = [
    python3Packages.evdev
    python3Packages.pygobject3
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Автоисправление раскладки ru/en для Linux на Wayland.";
    homepage = "https://github.com/Wetoshkin/WaySwitch";
    license = lib.licenses.mit;
  };
})
