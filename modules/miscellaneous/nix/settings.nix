{
  self,
  ...
}:

{
  zen.miscellaneous.nix.settings =
    let
      settings = (import "${self}/flake.nix").nixConfig // {
        max-jobs = 16;
        cores = 0;

        trusted-users = [ "@wheel" ];
      };
    in
    {
      nixos =
        {
          ...
        }:
        {
          nix = {
            inherit settings;
          };
        };

      finix =
        {
          ...
        }:
        {
          services.nix-daemon = {
            inherit settings;
          };
        };

      homeManager =
        {
          lib,
          config,
          ...
        }:
        {
          nix = {
            inherit settings;

            extraOptions = ''
              !include ${config.sops.templates."nix-access-tokens".path}
            '';
          };

          # FUCK I SO TIRED TO FIX THAT
          # WHY IS FIX IS RED????
          programs.fish.shellInitLast =
            {
              CACHIX_AUTH_TOKEN = config.sops.secrets."programs/cachix".path;
              GITHUB_TOKEN = config.sops.secrets."programs/github".path;
            }
            |> lib.generators.toKeyValue {
              mkKeyValue = key: value: "export ${key}=$(cat ${toString value})";
            };

          sops.secrets = {
            "programs/cachix" = { };
            "programs/github" = { };
          };

          sops.templates = {
            "nix-access-tokens".content = ''
              access-tokens = github.com=${config.sops.placeholder."programs/github"}
            '';
          };
        };
    };
}
