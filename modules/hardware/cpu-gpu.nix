{
  zen,
  ...
}:

{
  zen.hardware.cpu-gpu = {
    description = ''
      override and control temp for cpu/gpu
    '';

    includes = [
      zen.custom.cpupower-gui
    ];

    provides = {
      jetpure.nixos =
        {
          lib,
          config,
          ...
        }:
        {
          environment.variables = {
            RUSTICL_ENABLE = "radeonsi";
            ROC_ENABLE_PRE_VEGA = 1;
          };

          hardware = {
            cpu.amd = {
              ryzen-smu.enable = true;
              updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
            };

            graphics = {
              enable = true;
              enable32Bit = true;
            };

            amdgpu = {
              opencl.enable = true;

              overdrive = {
                enable = true;
                ppfeaturemask = "0xffffffff";
              };
            };
          };

          services.lact.enable = true;
        };

      blackmamba.nixos =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          hardware = {
            cpu.amd = {
              updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
            };

            graphics = {
              enable = true;
              enable32Bit = true;

              extraPackages = [ pkgs.rocmPackages.clr.icd ];
            };
          };

          services = {
            lact.enable = true;

            cpupower-gui = {
              enable = true;
              package = pkgs._fixed.cpupower-gui;
            };
          };
        };

      declaoke.nixos =
        {
          lib,
          config,
          ...
        }:
        {
          hardware = {
            cpu.intel = {
              updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
            };

            graphics = {
              enable = true;
              enable32Bit = true;
            };
          };

          services.lact.enable = true;
        };
    };
  };
}
