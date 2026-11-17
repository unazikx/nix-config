{
  zen,
  ...
}:

{
  zen.programs.desktop.noctalia = {
    description = ''
      modern desktop shell
      very good im impressed
    '';

    includes = [
      zen.miscellaneous.users.accounts
      zen.programs.desktop.noctalia.settings
    ];

    meta = {
      bar = "vertical";
    };

    wiki = {
      "Noctalia" = {
        extra = ''
          dont use their flake, noctalia also in nixpkgs

          use `nix eval --expr --impure 'builtins.fromTOML (builtins.readFile ./noctalia.toml)'`
          for make nix attrs config from toml
        '';

        links = [
          {
            name = "noctalia-wiki";
            link = "https://docs.noctalia.dev/noctalia";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    nixos =
      {
        ...
      }:
      {
        programs.noctalia = {
          enable = true;
          recommendedServices.enable = true;
        };

        security.pam.services = {
          noctalia.u2fAuth = true;
          quickshell.u2fAuth = true;
        };
      };

    homeManagerNixos =
      {
        osConfig,
        ...
      }:
      {
        programs.noctalia = {
          inherit (osConfig.programs.noctalia)
            enable
            package
            ;

          systemd.enable = true;
        };

        stylix.targets = {
          noctalia.enable = true;
        };
      };
  };

  zen.flake-parts.default = {
    includes = [ zen.programs.desktop.noctalia ];
  };
}
