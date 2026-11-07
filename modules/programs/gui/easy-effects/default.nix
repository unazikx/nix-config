{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nixpkgs-easyeffects = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-25.05"; # https://github.com/NixOS/nixpkgs/pull/427617.diff
    };
    # keep-sorted end
  };

  zen.programs.gui.easy-effects = {
    description = ''
      used for sound perfecting
      especcialy on my ThinkpadT14
      just cool

      used old...gtk version
      cause qt isnt cool
    '';

    includes = [
      zen.custom.easy-effects
      zen.programs.gui.easy-effects.perfectEQ
      zen.programs.gui.easy-effects.thinkpadT14
    ];

    homeManager =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        services.easyeffects = {
          enable = true;
          package =
            (import inputs.nixpkgs-easyeffects {
              inherit (pkgs)
                system
                ;
            }).easyeffects;
        };
      };
  };
}
