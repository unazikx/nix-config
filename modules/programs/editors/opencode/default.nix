{
  zen,
  ...
}:

{
  zen.programs.editors.opencode = {
    description = ''
      ai tool for coding and many also
      i use this for code and video montage

      code: nix, python, go
      video: remotion, canvas commons
    '';

    includes = [
      zen.programs.editors.opencode.caveman
      # zen.programs.editors.opencode.oh-my-opencode
      # zen.programs.editors.opencode.superpowers
    ];

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.opencode;
      in
      {
        programs.opencode = {
          enable = true;

          enableMcpIntegration = true;

          settings = {
            lsp = true;

            # formatter = {
            #   nixfmt = {
            #     command = [
            #       (lib.getExe pkgs.nixfmt)
            #       "$FILE"
            #     ];
            #     extensions = [
            #       ".nix"
            #     ];
            #   };

            #   black = {
            #     command = [
            #       (lib.getExe pkgs.black)
            #       "-"
            #     ];
            #     extensions = [
            #       ".py"
            #     ];
            #   };

            #   prettier = {
            #     command = [
            #       (lib.getExe pkgs.prettier)
            #       "--stdin-filepath"
            #       "$FILE"
            #     ];
            #     extensions = [
            #       ".css"
            #       ".js"
            #       ".jsx"
            #       ".md"
            #       ".scss"
            #       ".ts"
            #       ".tsx"
            #     ];
            #   };

            #   gofmt = {
            #     command = [
            #       (lib.getExe' pkgs.go "gofmt")
            #       "-w"
            #       "$FILE"
            #     ];
            #     extensions = [
            #       ".go"
            #     ];
            #   };
            # };
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
