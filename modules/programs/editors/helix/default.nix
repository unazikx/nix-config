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
            pkgs.black
            pkgs.gdtoolkit_4
            pkgs.go
            pkgs.gopls
            pkgs.libressl # nc
            pkgs.marksman
            pkgs.netcat
            pkgs.nixd
            pkgs.nixfmt
            pkgs.prettier
            pkgs.pyright
            pkgs.rust-analyzer
            pkgs.rustfmt
            # pkgs.typescript-language-server
            # ^^^
            #    specified: sha256-MUSxDMlbG21KSesGdEvqa2kEpuVfLlXRUX1qV/FGsSo=
            #    got:       sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=
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
