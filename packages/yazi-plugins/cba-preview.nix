{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "cba-preview.yazi";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "navysky12";
    repo = "comicthumb.yazi";
    rev = "fa398e831cab751223084a8dbaac21901b7c165f";
    hash = "sha256-FFPWdQxpyMyvIBJ8nR4v8EP56LDlatzxySCUwVwvGx8=";
  };

  meta = {
    description = "Yazi plugin to preview Comic Book Archive";
    homepage = "https://github.com/navysky12/comicthumb.yazi";
    license = lib.licenses.mit;
  };
}
