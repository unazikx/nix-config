{
  ...
}:

{
  zen.hardware.security.sudo = {
    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        security = {
          sudo.enable = false;
          sudo-rs = {
            enable = true;

            execWheelOnly = true;
            wheelNeedsPassword = true;

            extraRules = [
              {
                groups = [ "wheel" ];
                runAs = "root";

                commands = [
                  {
                    command = lib.getExe pkgs.brightnessctl;
                    options = [ "NOPASSWD" ];
                  }
                  {
                    command = lib.getExe' pkgs.coreutils "tee";
                    options = [ "NOPASSWD" ];
                  }
                ];
              }
            ];
          };
        };
      };

    finix =
      {
        inputs,
        ...
      }:
      {
        imports = [
          "${inputs.finix}/modules/programs/sudo"
        ];
      };
  };
}
