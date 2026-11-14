{
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        pkgs,
        lib,
        ...
      }:
      {
        files =
          {
            path = ".github/workflows/update.yaml";
            drv = pkgs.writers.writeYAML "update.yaml" {
              name = "Update own packages";

              on = {
                # just useful
                workflow_dispatch = { };
              };

              permissions = {
                contents = "write";
              };

              jobs = {
                update-flake = {
                  name = "Run update-flake";
                  runs-on = "ubuntu-latest";

                  steps = [
                    {
                      name = "Checkout";
                      uses = "actions/checkout@v7";
                    }
                    (import ./_tools.nix).install-nix
                    {
                      name = "Run flake#update-packages";
                      run =
                        # bash
                        ''
                          nix run .#fetch-all
                          nix fmt
                        '';
                    }
                    {
                      name = "Commit changes";
                      run =
                        # bash
                        ''
                          git config user.name "github-actions[bot]"
                          git config user.email "github-actions[bot]@users.noreply.github.com"
                          git add -A

                          if ! git diff --cached --quiet; then
                            git commit -m "flake: updated nix-packages [automated]"
                            git push
                          else
                            echo "No changes from updater"
                          fi
                        '';
                    }
                  ];
                };
              };
            };
          }
          |> lib.singleton;
      };
  };
}
