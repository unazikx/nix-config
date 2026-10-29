{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   jovian = {
  #     type = "github";
  #     owner = "jovian-experiments";
  #     repo = "jovian-nixos";
  #   };

  #   steamix = {
  #     type = "github";
  #     owner = "arunoruto";
  #     repo = "steamix";
  #     ref = "main";
  #   };
  #   # keep-sorted end
  # };

  zen.games.steamix = {
    description = ''
      massive configurator for NixOS alike it steamos
    '';

    includes = [
      zen.games.steam
    ];

    wiki = {
      "Millennium" = {
        links = [ ];
      };
    };

    nixos =
      {
        inputs,
        inputs',
        config,
        ...
      }:
      {
        imports = [
          inputs.steamix.nixosModules.default
        ];

        steamix = {
          enable = true;
          autoStart = false;

          binaryCache.enable = false;
          mangoapp.enable = false;

          manager = {
            enable = false;
            package = inputs'.jovian.legacyPackages.steamos-manager;
          };

          decky-loader = {
            enable = false;
            package = inputs'.jovian.legacyPackages.decky-loader;

            plugins = [ ];
          };

          library.boilr = {
            enable = false;

            steamGridDbKeyFile = config.sops.secrets."services/boilr".path;

            settings = {
              steam.create_collections = true;
            };
          };
        };

        sops.secrets = {
          "services/boilr" = { };
        };
      };

    homeManagerNixos =
      {
        config,
        ...
      }:
      {
        systemd.user.tmpfiles.rules = [
          "f ${config.xdg.dataHome}/Steam/.cef-enable-remote-debugging 644 - - - -"
        ];
      };

    provides = {
      jetpure.nixos =
        {
          ...
        }:
        {
          steamix.desktopSession = "umbriel"; # cause
        };
    };
  };
}
