{
  zen,
  ...
}:

{
  zen.programs.cli.handlr = {
    description = ''
      xdg-mime opener for multiple programs
    '';

    includes = [
      zen.programs.desktop.tofi
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        toml = pkgs.formats.toml { };
      in
      {
        home.packages = [
          pkgs.handlr-regex

          (
            pkgs.writeShellScriptBin "xdg-open" ''
              exec handlr open "$@"
            ''
            |> pkgs.hiPrio
          )
        ];

        xdg.configFile = {
          "handlr/handlr.toml".source = toml.generate "handlr-config.toml" {
            enable_selector = true;
            selector = "${lib.getExe config.programs.tofi.package} --prompt-text='Open with: '";
            term_exec_args = "-e";
            expand_wildcards = true;
          };
        };
      };
  };
}
