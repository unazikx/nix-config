{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "djvu-view.yazi";
  version = "git";

  src = fetchFromGitHub {
    owner = "Shallow-Seek";
    repo = "djvu-view.yazi";
    rev = "f218aa6870dba2eb8f26cf7675be125a502aac50";
    hash = "sha256-isg1Pd7u3m+TjsPjEWRljTUvybaOJZuspaHUxJig6qw=";
  };

  meta = {
    description = "Yazi plugin for djvu preview";
    homepage = "https://github.com/Shallow-Seek/djvu-view.yazi";
    license = lib.licenses.mit;
  };
}
