{
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        file.".gitignore" = {
          enable = false;
          text = ''
            *result
            *gitmal-output
          '';
        };
      };
  };
}
