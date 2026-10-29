{
  python3Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonApplication (_final: {
  pname = "anicli_api";
  version = "git";
  pyproject = true;

  src = fetchPypi {
    inherit (_final)
      pname
      version
      ;
    hash = "sha256-vl1NVoFGh68qSN/N7ZIUOq1CKq44xvQyqZX/oJ5r1mo=";
  };

  build-system = [
    python3Packages.hatchling
  ];

  dependencies = lib.flatten [
    # keep-sorted start
    python3Packages.attrs
    python3Packages.h2
    python3Packages.hatchling
    python3Packages.httpx
    python3Packages.parsel
    python3Packages.tqdm
    # keep-sorted end
  ];

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Parse anime from RU websites";
    homepage = "https://github.com/vypivshiy/anicli-api";
    license = lib.licenses.mit;
  };
})
