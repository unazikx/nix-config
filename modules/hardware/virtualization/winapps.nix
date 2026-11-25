{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    massgravel = {
      type = "github";
      owner = "massgravel";
      repo = "microsoft-activation-scripts";
      flake = false;
    };

    remove-edge = {
      type = "github";
      owner = "shadowwhisperer";
      repo = "remove-ms-edge";
      flake = false;
    };

    winapps = {
      type = "github";
      owner = "winapps-org";
      repo = "winapps";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # keep-sorted end
  };

  zen.hardware.virtualization.winapps = {
    description = ''
      http://127.0.0.1:8006

      windows11 in qemu that in podman
      idk will it works or not

      after installation every tool and apps run:
      > winapps-setup --user --setupAllOfficiallySupportedApps

      > wlfreerdp /u:"user" /p:"password" /v:address:port /cert:tofu /size:1920x1080
    '';

    includes = [
      zen.hardware.virtualization.podman
    ];

    homeManagerNixos =
      {
        inputs,
        inputs',
        pkgs,
        config,
        ...
      }:
      {
        home.packages = [
          inputs'.winapps.packages.winapps
          pkgs.freerdp
        ];

        services.podman = {
          containers."WinApps" = {
            # https://github.com/winapps-org/winapps/blob/1b38cab1b8c1a513e4a313931759ac4942473678/setup.sh#L1007
            autoStart = true;

            image = "ghcr.io/dockur/windows:latest";

            environment = {
              # https://github.com/dockur/windows/blob/master/docs/environment.md
              VERSION = "core11";
              CPU_CORES = "4";
              GPU = "Y";

              RAM_SIZE = "4G";
              DISK_SIZE = "32G";

              REGION = "en-US";
              KEYBOARD = "en-US";

              CONNECTIONS = "8";
              REMOVE = "N";
            };

            ports = [
              "8006:8006"
              "3389:3389/tcp"
              "3389:3389/udp"
            ];

            devices = [
              "/dev/dri"
              "/dev/kvm"
              "/dev/net/tun"
            ];

            # in NixOS it named -> extraOptions
            extraPodmanArgs = [
              "--cap-add=NET_ADMIN"
              "--cap-add=CAP_NET_RAW"
              "--device=/dev/kvm:rw"
            ];

            volumes = [
              "windows-storage:/storage"

              "${config.home.homeDirectory}:/shared/home:rw"
              "/media:/shared/media:rw"

              # cause install.bat (original) have an errors
              "${
                pkgs.fetchFromGitHub {
                  owner = "unazikx";
                  repo = "winapps";
                  rev = "42c7e8318280c6fc3426c7afebfc7f43b895f4c8";
                  hash = "sha256-eSUFY+u9Xq9/i/0/OH5JhVzTvG+eiOEvUErAmfBzaBE=";
                }
              }/oem:/oem"

              # ye, why not?
              "${inputs.massgravel}/MAS/Separate-Files-Version/Activators/HWID_Activation.cmd:/shared/mas-activator.cmd:ro"
              "${inputs.remove-edge}/Batch/Both.bat:/shared/edge-uninstaller.cmd:ro"
            ];

            # why not environmentFiles
            environmentFile = [
              config.security.nix-secrets.templates."programs-winapps-env".path
            ];
          };

          volumes = {
            # auto create directory for windows
            "windows-storage" = { };
          };
        };

        security.nix-secrets.secrets = {
          "programs-windows-username" = {
            generator = "random-word";
          };

          "programs-windows-password" = {
            generator.password = {
              length = 16;
              numbers = false;
            };
          };
        };

        security.nix-secrets.templates = {
          "programs-winapps-env" = {
            path = "${config.xdg.configHome}/winapps/winapps.env";
            content =
              # env
              ''
                USERNAME=${config.security.nix-secrets.secrets."programs-windows-username"}
                PASSWORD=${config.security.nix-secrets.secrets."programs-windows-password"}
              '';
          };

          "programs-winapps-conf" = {
            path = "${config.xdg.configHome}/winapps/winapps.conf";
            content =
              # https://github.com/winapps-org/winapps/discussions/972#discussioncomment-18421216
              # conf
              ''
                RDP_USER="${config.security.nix-secrets.secrets."programs-windows-username"}"
                RDP_PASS="${config.security.nix-secrets.secrets."programs-windows-password"}"
                WAFLAVOR="manual"
                VM_NAME="RDPWindows"
                REMOVABLE_MEDIA="/run/media"
                APP_SCAN_TIMEOUT="60"
                BOOT_TIMEOUT="120"
                PORT_TIMEOUT="5"
                RDP_FLAGS="/cert:tofu /sound /microphone"
                RDP_IP="127.0.0.1"
                RDP_SCALE="100"
                RDP_TIMEOUT="30"
              '';
          };
        };
      };
  };
}
