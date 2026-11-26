{
  ...
}:

{
  zen.services.tlp = {
    description = ''
      Power management tuned for ThinkPad T14 Gen 1 AMD
    '';

    nixos =
      {
        lib,
        config,
        ...
      }:
      {
        services.tlp = {
          enable = true;

          settings = {
            # keep-sorted start block=yes
            AHCI_RUNTIME_PM_ON_AC = "on";
            AHCI_RUNTIME_PM_ON_BAT = "auto";
            AMDGPU_ABM_LEVEL_ON_AC = 0;
            AMDGPU_ABM_LEVEL_ON_BAT = 3;
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;
            CPU_DRIVER_OPMODE_ON_AC = "active";
            CPU_DRIVER_OPMODE_ON_BAT = "active";
            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MAX_PERF_ON_BAT = 65;
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_SCALING_GOVERNOR_ON_AC = "powersave";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth wwan";
            MEM_SLEEP_ON_AC = "s2idle";
            MEM_SLEEP_ON_BAT = "s2idle";
            NMI_WATCHDOG = 0;
            PCIE_ASPM_ON_AC = "default";
            PCIE_ASPM_ON_BAT = "powersupersave";
            PLATFORM_PROFILE_ON_AC = "performance";
            PLATFORM_PROFILE_ON_BAT = "low-power";
            RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
            RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
            RUNTIME_PM_ON_AC = "on";
            RUNTIME_PM_ON_BAT = "auto";
            SOUND_POWER_SAVE_CONTROLLER = "Y";
            SOUND_POWER_SAVE_ON_AC = 1;
            SOUND_POWER_SAVE_ON_BAT = 1;
            START_CHARGE_THRESH_BAT0 = 95;
            STOP_CHARGE_THRESH_BAT0 = 100;
            USB_AUTOSUSPEND = 1;
            USB_EXCLUDE_BTUSB = 1;
            USB_EXCLUDE_PHONE = 1;
            WIFI_PWR_ON_AC = "off";
            WIFI_PWR_ON_BAT = "on";
            WOL_DISABLE = "Y";
            # keep-sorted end
          };
        };

        services.power-profiles-daemon = {
          enable = lib.mkForce false;
        };

        boot.extraModulePackages = [
          config.boot.kernelPackages.acpi_call
        ];

        boot.kernelParams = [
          "amd_pstate=active"
          "pcie_aspm=force"
          "pcie_aspm.policy=powersupersave"
        ];

        boot.kernelModules = [
          "acpi_call"
          "thinkpad_acpi"
        ];
      };
  };
}
