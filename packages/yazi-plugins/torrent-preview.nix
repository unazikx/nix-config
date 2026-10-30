{
  yaziPlugins,
  fetchFromGitHub,
  lib,
}:

yaziPlugins.mkYaziPlugin {
  pname = "torrent-preview.yazi";
  version = "git";

  src = fetchFromGitHub {
    owner = "kirasok";
    repo = "torrent-preview.yazi";
    rev = "f46528243c458de3ffce38c44607d5a0cde67559";
    hash = "sha256-VhJvNRKHxVla4v2JJeSnP0MOMBFSm4k7gfqjrHOMVlo=";
  };

  meta = {
    description = "Yazi plugin to preview bittorrent files";
    homepage = "https://github.com/kirasok/torrent-preview.yazi";
    license = lib.licenses.agpl3Only;
  };
}
