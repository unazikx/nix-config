{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "convert.yazi";
  version = "git";

  src = fetchFromGitHub {
    owner = "twempi";
    repo = "convert.yazi";
    rev = "97946adfc3ab769c4586a9c1780c475c6699f820";
    hash = "sha256-cD4s1NXz09+DmBcYb95OMUez1RMiro7Y4YzRPKI0wtA=";
  };

  meta = {
    description = "Yazi plugin to convert images";
    homepage = "https://github.com/JohWQ/convert.yazi";
    license = lib.licenses.mit;
  };
}
