{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hjem = {
      type = "github";
      owner = "feel-co";
      repo = "hjem";
    };

    hjem-rum = {
      type = "github";
      owner = "snugnug";
      repo = "hjem-rum";
    };
    # keep-sorted end
  };
}
