{
  ...
}:

{
  zen.programs.cli.nh = {
    description = ''
      good? ye im gooner
    '';

    nixos =
      {
        host,
        ...
      }:
      {
        programs.nh = {
          enable = true;
          flake = host.flakeDir;
        };
      };

    homeManager =
      {
        host,
        ...
      }:
      {
        programs.nh = {
          enable = true;
          flake = host.flakeDir;
        };
      };
  };
}
