{
  inputs,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    files = {
      type = "github";
      owner = "sini";
      repo = "files";
    };
    # keep-sorted end
  };

  imports = [
    inputs.files.flakeModules.default
  ];

  zen.flake-parts.default = {
    apps =
      {
        pkgs,
        config,
        ...
      }:
      {
        write-files.program = pkgs.writeShellApplication {
          name = "write-files-fmt";

          runtimeInputs = [
            config.files.writer.drv
            config.formatter
          ];

          derivationArgs = {
            allowSubstitutes = false;
            preferLocalBuild = true;
          };

          text = "write-files && treefmt";
        };
      };
  };
}
