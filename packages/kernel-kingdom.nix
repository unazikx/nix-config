{
  python3Packages,
  fetchFromGitHub,
  lib,
}:

python3Packages.buildPythonApplication (_final: {
  pname = "kernel-kingdom";
  version = "git";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rsmedrano-cloud";
    repo = "kernel-kingdom";
    rev = "d6d43bed2e733c395b607fa11f225fa22029529a";
    hash = "sha256-VPXo2j7aHyUHL8HjN2JAqcWMA8XGhRUWMqsOpWcWvfc=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = [
    python3Packages.psutil
  ];

  dontWrapGApps = false;

  meta = {
    description = "Pixel-art live wallpaper / game whose kingdoms grow from your system's processes, RAM, CPU and containers.";
    homepage = "https://github.com/rsmedrano-cloud/kernel-kingdom";
    license = lib.licenses.mit;
    mainProgram = "kernel-kingdom";
  };
})
