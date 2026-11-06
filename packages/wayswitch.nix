{
  python3Packages,
  fetchFromGitHub,
  lib,
}:

python3Packages.buildPythonPackage (_final: {
  pname = "wayswitch";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Wetoshkin";
    repo = "WaySwitch";
    tag = "v${_final.version}";
    hash = "sha256-wEHANJb8u7BrgY9GzEi14bgNkOamILOrYycW/NRYF+E=";
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
