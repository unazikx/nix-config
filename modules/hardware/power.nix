{
  ...
}:

{
  zen.hardware.power = {
    description = ''
      power control
    '';

    nixos =
      {
        ...
      }:
      {
        services.upower = {
          enable = true;

          percentageLow = 15;
          percentageCritical = 10;
          percentageAction = 5;
          criticalPowerAction = "HybridSleep";
        };

        powerManagement = {
          enable = true;
          powertop.enable = true;
        };

        boot.extraModprobeConfig =
          # modprobe
          ''
            options snd_hda_intel power_save=1 power_save_controller=Y
            options iwlwifi power_save=1 uapsd_disable=0
            options iwlmvm power_scheme=3
          '';
      };
  };
}
