{
  ...
}:

{
  zen.flake-parts.default = {
    apps =
      {
        pkgs,
        config,
        ...
      }:
      {
        fetch-all = {
          program = pkgs.writeShellApplication {
            name = "execute-fetch";

            derivationArgs = {
              allowSubstitutes = false;
              preferLocalBuild = true;
            };

            text = ''
              nix run .#update-packages
              nix run .#firefox-fetcher -- \
                ./packages/firefox-addons/registry.jsonc \
                -o ./packages/firefox-addons/output.nix
            '';
          };

          meta = {
            description = "Runs every fetchers";
          };
        };

        update-packages = rec {
          program = config.packages.update-packages;
          meta = program.meta;
        };

        firefox-fetcher = rec {
          program = config.packages.firefox-fetcher;
          meta = program.meta;
        };
      };
  };
}
