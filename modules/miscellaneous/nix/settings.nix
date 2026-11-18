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
      os =
        {
          host,
          ...
        }:
        {
          environment.variables = {
            FLAKE = host.flakeDir;
          };
        };

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
              !include ${config.security.nix-secrets.templates."nix-access-tokens".path}
            '';
          };

          # FUCK I SO TIRED TO FIX THAT
          # WHY IS FIX IS RED????
          programs.fish.shellInitLast =
            {
              CACHIX_AUTH_TOKEN = config.security.nix-secrets.secrets."programs-cachix".path;
              GITHUB_TOKEN = config.security.nix-secrets.secrets."programs-github".path;
            }
            |> lib.generators.toKeyValue {
              mkKeyValue = key: value: "export ${key}=$(cat ${toString value})";
            };

          security.nix-secrets.secrets = {
            "programs-cachix" = { };
            "programs-github" = { };
          };

          security.nix-secrets.templates = {
            "nix-access-tokens" = {
              content = ''
                access-tokens = github.com=${config.security.nix-secrets.secrets."programs-github"}
              '';
            };
          };
        };
    };
}
