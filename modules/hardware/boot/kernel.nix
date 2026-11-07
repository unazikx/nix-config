{
  ...
}:

{
  zen.hardware.boot.kernel = {
    description = ''
      boot settings
      kernel and this modules
    '';

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        boot = {
          kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

          tmp = {
            cleanOnBoot = true;
            useTmpfs = true;
            tmpfsSize = "50%";
          };

          consoleLogLevel = 0;

          initrd = {
            compressor = "zstd";
            compressorArgs = [ "-16" ];
          };
        };
      };
  };
}
