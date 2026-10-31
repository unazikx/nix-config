{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    rbw-forked = {
      type = "github";
      owner = "pschmitt";
      repo = "rbw";
    };
    # keep-sorted end
  };

  zen.programs.cli.rbw = {
    description = ''
      bitwarden cli client
      rbw-fzf is frontend for rbw
    '';

    homeManager =
      {
        inputs,
        inputs',
        pkgs,
        lib,
        config,
        ...
      }:
      {
        imports = [
          inputs.rbw-forked.homeManagerModules.default
        ];

        programs.rbw = {
          enable = true;

          package = inputs'.rbw-forked.packages.rbw;

          settings = {
            # keep-sorted start block=yes
            accounts.personal = {
              email.file = config.sops.secrets."programs/rbw/email".path;
              baseUrl.file = config.sops.secrets."programs/rbw/url".path;
            };
            agent = {
              lockTimeout = 86400;
              syncInterval = 10;
            };
            passwordGen.length = 32;
            pinentry.command = lib.getExe pkgs.pinentry-gnome3;
            primaryAccount = "personal";
            # keep-sorted end
          };
        };

        sops.secrets = {
          "programs/rbw/email" = { };
          "programs/rbw/url" = { };
        };
      };
  };
}
