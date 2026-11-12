{
  zen,
  ...
}:

{
  zen.hardware.security.yubikey = {
    description = ''
      module for
    '';

    includes = [
      zen.miscellaneous.nur
    ];

    wiki = {
      "Yubikey" = {
        extra = ''
          i buyed this [tenstar rp2350usb](https://aliexpress.ru/item/1005008624373149.html)

          and programmed via [rs-key](https://themaxmur.github.io/RS-Key) to Yubikey 5

          dont use picoforge flake directly, that have 6.0.0 version,
          here is latest from [jetcookies](https://github.com/nix-community/nur-combined/blob/main/repos/jetcookies/pkgs/picoforge/default.nix)

          use `sudo pamu2fcfg -N` and `sudo -u nixzoid pamu2fcfg -N` for generate pam to use Yubikey
        '';

        links = [
          {
            name = "rs-key";
            link = "https://github.com/TheMaxMur/RS-Key";
            logo = "https://avatars.githubusercontent.com/u/31189199";
          }
          {
            name = "picoforge";
            link = "https://github.com/librekeys/picoforge";
            logo = "https://avatars.githubusercontent.com/u/253655950";
          }
          {
            name = "qol-yubikeys";
            link = "https://unmovedcentre.com/posts/improving-qol-on-nixos-with-yubikey";
            logo = "https://unmovedcentre.com/img/emergentmind_avatar_200k.jpeg";
          }
        ];
      };
    };

    nixos =
      {
        self',
        pkgs,
        lib,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.age-plugin-yubikey
          pkgs.libfido2
          pkgs.opensc
          pkgs.pcsc-tools
          pkgs.yubikey-manager
          self'.packages.picoforge
        ];

        programs = {
          yubikey-manager.enable = true;
          yubikey-touch-detector.enable = true;
        };

        services.yubikey-agent = {
          enable = true;
        };

        services.pcscd = {
          enable = true;
          plugins = lib.mkForce [
            pkgs.ccid
          ];
        };

        services.udev = {
          enable = true;
          packages = [
            pkgs.libfido2
            pkgs.yubikey-manager
            pkgs.yubikey-personalization
          ];
        };
      };

    provides.jetpure = {
      nixos =
        {
          config,
          ...
        }:
        {
          security.pam = {
            u2f = {
              enable = true;

              settings = {
                authfile = config.sops.secrets."password/authfile".path;
                cue = true;
              };
            };

            services = {
              login.u2fAuth = true;
              polkit-1.u2fAuth = true;
              sudo.u2fAuth = true;
              su.u2fAuth = true;
            };
          };

          sops.secrets = {
            "password/authfile" = { };
          };
        };
    };
  };
}
