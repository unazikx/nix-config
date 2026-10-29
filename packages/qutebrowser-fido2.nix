{
  qutebrowser,
  fetchFromGitHub,
}:

qutebrowser.overrideAttrs (
  _final: _prev: {
    version = "git";

    src = fetchFromGitHub {
      owner = "coderkun";
      repo = "qutebrowser";
      tag = "issue-8533-fido2-user-verification";
      hash = "sha256-KrGFlqZGHtaBCnyxvJCqoeG5Ndo7dSw//8HkIjVSYxQ=";
    };
  }
)
