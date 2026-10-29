{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    sopsnix = {
      type = "github";
      owner = "mic92";
      repo = "sops-nix";
    };
    # keep-sorted end
  };

  zen.secrets.sopsnix = {
    includes = [
      zen.hardware.security.yubikey
      zen.secrets
    ];

    nixos =
      {
        inputs,
        pkgs,
        host,
        ...
      }:
      let
        meta = zen.secrets.meta;

        keyFilePath =
          if (host.hasAspect zen.hardware.security.yubikey) then meta.yubikey else "/secrets/age-key";
      in
      {
        imports = [
          inputs.sopsnix.nixosModules.sops
        ];

        environment.systemPackages = [
          pkgs.age
          pkgs.age-plugin-yubikey
          pkgs.sops
          pkgs.ssh-to-age
        ];

        environment.sessionVariables = {
          SOPS_AGE_KEY_FILE = keyFilePath;
          SOPS_CONFIG = "secrets/config.yaml";
        };

        sops.age = {
          keyFile = keyFilePath;
          plugins = [ pkgs.age-plugin-yubikey ];
        };
      };

    homeManagerNixos =
      {
        inputs,
        pkgs,
        host,
        ...
      }:
      let
        meta = zen.secrets.meta;

        keyFilePath =
          if (host.hasAspect zen.hardware.security.yubikey) then meta.yubikey else "/secrets/age-key";
      in
      {
        imports = [
          inputs.sopsnix.homeModules.sops
        ];

        home.packages = [
          pkgs.age
          pkgs.age-plugin-yubikey
          pkgs.sops
          pkgs.ssh-to-age
        ];

        home.sessionVariables = {
          SOPS_AGE_KEY_FILE = keyFilePath;
          SOPS_CONFIG = "secrets/config.yaml";
        };

        sops.age = {
          keyFile = keyFilePath;
          plugins = [ pkgs.age-plugin-yubikey ];
        };
      };
  };
}
