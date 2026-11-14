{
  zen,
  ...
}:

{
  zen.programs.editors.helix = {
    description = ''
      best text editor
      and code editor
    '';

    includes = [
      zen.programs.editors.helix.binds
      zen.programs.editors.helix.languages
      zen.programs.editors.helix.settings
      zen.programs.editors.helix.theme
    ];

    homeManager =
      {
        pkgs,
        lib,
        ...
      }:
      {
        home.shellAliases.e = "$EDITOR"; # cause defaultEditor

        programs.helix = {
          enable = true;

          extraPackages = [
            # keep-sorted start
            pkgs.bash-language-server
            pkgs.black
            pkgs.clang-tools
            pkgs.fish-lsp
            pkgs.gdtoolkit_4
            pkgs.go
            pkgs.gopls
            pkgs.just-lsp
            pkgs.libressl # nc
            pkgs.marksman
            pkgs.netcat
            pkgs.nimlangserver
            pkgs.nixd
            pkgs.nixfmt
            pkgs.prettier
            pkgs.pyright
            pkgs.python3Packages.python-lsp-server
            pkgs.rust-analyzer
            pkgs.rustfmt
            pkgs.taplo
            pkgs.typescript-language-server
            pkgs.vscode-langservers-extracted
            pkgs.yaml-language-server
            # keep-sorted end
          ];
        };

        programs.fish.shellInitLast =
          {
            EDITOR = "hx";
            VISUAL = "hx";
          }
          |> lib.generators.toKeyValue {
            mkKeyValue = key: value: "export ${key}='${value}'";
          };

        stylix.targets = {
          helix.enable = false;
        };
      };
  };
}
