{
  ...
}:

{
  zen.miscellaneous.minimal = {
    nixos =
      {
        lib,
        ...
      }:
      {
        programs = {
          nano.enable = false;
          command-not-found.enable = false;
        };

        documentation = {
          dev.enable = false;
          doc.enable = false;
          info.enable = false;
          man.enable = false;
          nixos.enable = false;
        };

        system = {
          disableInstallerTools = true;

          tools = {
            nixos-rebuild.enable = true;
          };
        };

        systemd.generators.systemd-ssh-generator = "/dev/null";
        systemd.sockets.sshd-unix-local.enable = lib.mkForce false;
        systemd.sockets.sshd-vsock.enable = lib.mkForce false;
      };

    finix =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.finix-community.nixosModules.minimal
        ];

        profiles.minimal = {
          enable = true;
          withFlakes = true;
          deviceManager = "udev";
        };
      };

    homeManager =
      {
        ...
      }:
      {
        news.display = "silent";

        programs.man.enable = false;

        manual = {
          html.enable = false;
          json.enable = false;
          manpages.enable = false;
        };
      };
  };
}
