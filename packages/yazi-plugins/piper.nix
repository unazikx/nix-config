{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin (_final: {
  pname = "piper.yazi";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "alberti42";
    repo = "faster-piper.yazi";
    tag = "v${_final.version}";
    hash = "sha256-a7/KTIoIU9idxhYmYFsp6/ezmiBK/mEYfEz9zqZZiEU=";
  };

  meta = {
    description = "Pipe any shell command as a cached previewer";
    homepage = "https://github.com/alberti42/faster-piper.yazi";
    license = lib.licenses.mit;
  };
})
