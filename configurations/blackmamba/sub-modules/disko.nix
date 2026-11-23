{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        inputs,
        host,
        ...
      }:
      {
        imports = [
          inputs.disko.nixosModules.default
        ];

        disko.devices.disk = {
          "${baseNameOf host.device}" = {
            device = host.device;

            type = "disk";

            content = {
              type = "gpt";

              partitions = {
                esp = {
                  label = "boot-efi";

                  size = "512M";
                  type = "EF00";

                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";

                    mountOptions = [
                      "defaults"
                      "umask=0077"
                    ];
                  };
                };

                swap = {
                  label = "swap-${host.hostName}";

                  size = "32G";

                  content = {
                    type = "swap";
                    resumeDevice = true;
                  };
                };

                root = {
                  label = "nixos-${host.hostName}";

                  size = "100%";

                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };
  };
}
