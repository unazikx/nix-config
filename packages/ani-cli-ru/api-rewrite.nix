{
  python3Packages,
  fetchFromGitHub,
  lib,
}:

python3Packages.buildPythonApplication (_final: {
  pname = "anicli_api_rewrite";
  version = "git";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vypivshiy";
    repo = "anicli-api";
    rev = "3722232774bd714403c3bdb9be0ac285107f24bb";
    hash = "sha256-ZvCtKKXG8URksg4d6dBfy0ETKdnLj5YDYUegzRWrds0=";
  };

  build-system = [
    python3Packages.hatchling
  ];

  dependencies = [
    # keep-sorted start
    python3Packages.attrs
    python3Packages.cssselect
    python3Packages.httpx2
    python3Packages.lxml
    python3Packages.typing-extensions
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
