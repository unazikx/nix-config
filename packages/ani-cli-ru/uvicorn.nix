{
  python3Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonApplication (_final: {
  pname = "uvicorn";
  version = "0.54.0";
  pyproject = true;

  src = fetchPypi {
    inherit (_final)
      pname
      version
      ;
    hash = "sha256-ouM8v6oDBvjmsME+DLidfXoto+YrkMZuGMM9mAeyhiA=";
  };

  build-system = [
    python3Packages.hatchling
  ];

  dependencies = [
    python3Packages.click
    python3Packages.h11
    python3Packages.typing-extensions
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "ASGI web server implementation for Python";
    homepage = "https://github.com/Kludex/uvicorn";
    license = lib.licenses.bsd3ClauseTso;
    mainProgram = "uvicorn";
  };
})
