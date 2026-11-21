{
  ...
}:

{
  zen.hardware.brightness = {
    description = ''
      control brightness via ctl
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        hardware.i2c = {
          enable = true;
        };

        environment.systemPackages = [
          pkgs.ddcutil
        ];
      };

    user =
      {
        lib,
        ...
      }:
      {
        extraGroups = "i2c" |> lib.singleton;
      };
  };
}
