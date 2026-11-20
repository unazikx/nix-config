{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        imports = [
          "${inputs.nixos-hardware}/common/gpu/amd"
          "${inputs.nixos-hardware}/common/cpu/amd"
          "${inputs.nixos-hardware}/common/cpu/amd/pstate.nix"
          "${inputs.nixos-hardware}/common/cpu/amd/zenpower.nix"
          inputs.nixpkgs.nixosModules.notDetected
        ];

        boot = {
          kernelPackages = lib.mkForce pkgs.linuxPackages_xanmod;

          # kernelPackages =
          #   (pkgs.linuxKernel.packagesFor (
          #     let
          #       cachy = pkgs.cachyosKernels;
          #     in
          #     cachy.linux-cachyos-latest-lto-x86_64-v3
          #   )).extend
          #     (_final: _prev: { });

          tmp.cleanOnBoot = true;
          consoleLogLevel = 0;

          kernelModules = [
            "ntsync"
            "kvm-amd"
            "tun"
            "tap"
          ];

          kernelParams = [
            "acpi.sleep_state=3"
            "amdgpu.runpm=0"
            "mem_sleep_default=deep"
            "quiet"
            "acpi.ec_no_wakeup=1"
            "acpi_enforce_resources=lax"
          ];
        };
      };
  };
}
