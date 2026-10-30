{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "yatline.yazi";
  version = "git";

  src = fetchFromGitHub {
    owner = "imsi32";
    repo = "yatline.yazi";
    rev = "dc44b737791c07a8e2de54d8838cfe304853d780";
    hash = "sha256-U7MAZSc0iPiRvLZM8tKbNd749pblarB1Y48lH13uLuU=";
  };

  meta = {
    description = "Yazi plugin for customizing both header-line and status-line";
    homepage = "https://github.com/imsi32/yatline.yazi";
    license = lib.licenses.mit;
  };
}
