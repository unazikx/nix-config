{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   late-sh = {
  #     type = "github";
  #     owner = "mpiorowski";
  #     repo = "late-sh";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #     inputs.flake-utils.follows = "flake-utils";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.cli.late-sh = {
    description = ''
      cozy terminal clubhouse for developers
      companion CLI for local audio playback
    '';

    homeManager =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.late-sh.packages.late
        ];
      };
  };
}
