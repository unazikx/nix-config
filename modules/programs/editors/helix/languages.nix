{
  ...
}:

{
  zen.programs.editors.helix.languages = {
    homeManager =
      {
        ...
      }:
      {
        programs.helix.languages = {
          language =
            [
              # keep-sorted start block=yes
              {
                name = "css";

                language-servers = [ "vscode-css-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "css"
                  ];
                };
              }
              {
                name = "gdscript";

                language-servers = [ "godot" ];

                formatter = {
                  command = "nc";
                  args = [
                    "127.0.0.1"
                    "6005"
                  ];
                };
              }
              {
                name = "go";

                language-servers = [
                  "gopls"
                  "golangci-lint-langserver"
                  "codebook"
                ];

                formatter = {
                  command = "gofmt";
                };
              }
              {
                name = "json";

                language-servers = [ "vscode-json-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "json"
                  ];
                };
              }
              {
                name = "jsonc";

                language-servers = [ "vscode-json-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "json"
                  ];
                };
              }
              {
                name = "markdown";

                language-servers = [ "marksman" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "markdown"
                  ];
                };
              }
              {
                name = "nix";

                language-servers = [ "nixd" ];

                formatter = {
                  command = "nixfmt";
                };
              }
              {
                name = "python";

                language-servers = [ "pylsp" ];

                formatter = {
                  command = "black";
                };
              }
              {
                name = "rust";

                language-servers = [
                  "rust-analyzer"
                ];

                formatter = {
                  command = "rustfmt";
                  args = [
                    "--edition"
                    "2024"
                  ];
                };
              }
              {
                name = "scss";

                language-servers = [ "vscode-css-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "scss"
                  ];
                };
              }
              {
                name = "tsx";

                language-servers = [ "typescript-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "typescript"
                  ];
                };
              }
              {
                name = "typescript";

                language-servers = [ "typescript-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "typescript"
                  ];
                };
              }
              {
                name = "yaml";

                language-servers = [ "yaml-language-server" ];

                formatter = {
                  command = "prettier";
                  args = [
                    "--use-tabs"
                    "--parser"
                    "yaml"
                  ];
                };
              }
              # keep-sorted end
            ]
            |> map (
              params:
              {
                auto-format = true;
                indent = {
                  tab-width = 2;
                  unit = "  ";
                };
              }
              // params
            );
        };
      };
  };
}
