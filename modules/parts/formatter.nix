{
  ...
}:

{
  zen.flake-parts.default = {
    root =
      {
        pkgs,
        ...
      }:
      {
        # https://github.com/numtide/treefmt-nix/tree/main/examples
        formatter = pkgs.treefmt.withConfig {
          runtimeInputs = [
            # keep-sorted start block=yes
            pkgs.deadnix
            pkgs.keep-sorted
            pkgs.nixfmt
            # pkgs.pedantix
            pkgs.prettier
            # keep-sorted end
          ];

          settings = {
            excludes = [
              ".gitignore"
            ];

            formatter = {
              # keep-sorted start block=yes newline_separated=yes
              # pedantix = {
              #   command = "pedantix";
              #   excludes = [ ];
              #   includes = [ "*.nix" ];
              #   options = [
              #     "--config"
              #     config.packages.pedantix-config
              #   ];
              #   priority = 1;
              # };

              deadnix = {
                command = "deadnix";
                excludes = [ ];
                includes = [ "*.nix" ];
                options = [ "--edit" ];
              };

              keep-sorted = {
                command = "keep-sorted";
                excludes = [ ];
                includes = [ "*" ];
                options = [ ];
              };

              nixfmt = {
                command = "nixfmt";
                includes = [ "*.nix" ];
              };

              prettier = {
                command = "prettier";
                excludes = [ ];
                includes = [
                  "*.md"
                  "*.mdx"
                ];
                options = [ "--write" ];
              };
              # keep-sorted end
            };
          };
        };
      };

    packages =
      {
        pkgs,
        ...
      }:
      {
        pedantix-config =
          let
            toml = pkgs.formats.toml { };
          in
          {
            args = {
              sort = true;

              first = [
                "self"
                "self'"
                "inputs"
                "inputs'"
                "pkgs"
                "lib"
                "config"
                "system"
                "modulesPath"
                "host"
                "home"
                "user"
              ];

              last = [
                "<defaulted>"
                "..."
              ];
            };

            attrs = {
              sort = false;
              merge = true;
            };

            files = [
              {
                pattern = "**/packages/**";
                preset = "nixpkgs-package";
                attrs.sort = true;
                overrides = [
                  {
                    path = "**.replacements";
                    attrs.first = [
                      "oldDependency"
                      "newDependency"
                    ];
                  }
                ];
              }
            ];
          }
          |> toml.generate "pedantix-config.toml";
      };
  };
}
