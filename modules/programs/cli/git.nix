{
  ...
}:

{
  zen.programs.cli.git = {
    description = ''
      versioning directories and projects
      P1: please muself use jujutsu
      P2: ill make it soon
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        programs.git = {
          enable = true;
          package = pkgs.gitMinimal;
        };
      };

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        home.packages = [
          pkgs.onefetch
        ];

        programs.git = {
          enable = true;
          package = pkgs.gitMinimal;

          settings = {
            color = {
              ui = true;

              diff = {
                commit = "yellow";
                frag = "cyan";
                meta = "yellow";
                new = "green";
                old = "red";
                whitespace = "red reverse";
              };
            };

            init.defaultBranch = "main";
            safe.directory = "*";
          };

          signing = {
            key = lib.mkDefault "~/.ssh/id_ed25519.pub";
            signByDefault = true;
            format = "ssh";
          };

          includes = [
            { path = config.security.nix-secrets.templates."programs-git-credentials".path; }
          ];
        };

        security.nix-secrets.secrets = {
          "programs-git-mail" = { };
          "programs-git-user" = { };
        };

        security.nix-secrets.templates = {
          "programs-git-credentials" = {
            content = ''
              [user]
              name = ${config.security.nix-secrets.secrets."programs-git-user"}
              email = ${config.security.nix-secrets.secrets."programs-git-mail"}
            '';
          };
        };
      };
  };
}
