{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   sekka = {
  #     type = "github";
  #     owner = "bitemyapp";
  #     repo = "sekka";
  #     flake = false;
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.aizome = {
    description = ''
      modern window manager
      built from scratch
      inspired haiku (?)
    '';

    includes = [
      zen.programs.desktop.keyring
      zen.programs.desktop.sunsetr
      zen.programs.terminal.foot
    ];

    nixos =
      {
        inputs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.aizome;
      in
      {
        imports = [
          (import "${inputs.sekka}/desktop/aizome/nix" {
            inherit (inputs) nixpkgs;
          }).nixosModules.aizome
        ];

        programs.aizome = {
          enable = true;
        };

        programs.uwsm = {
          # doesnt works
          waylandCompositors.aizome = {
            prettyName = "Aizome";
            binPath = lib.getExe cfg.package;
          };
        };
      };

    homeManagerNixos =
      {
        # pkgs,
        ...
      }:
      let
        # toml = pkgs.formats.toml { };
      in
      {
        # https://gist.github.com/unazikx/0e1c4c838c897946f39e2f94ae64444e
        # xdg.configFile = {
        #   "aizome/settings.toml".source = toml.generate "aizome-settings.toml" { };
        # };
      };
  };
}
