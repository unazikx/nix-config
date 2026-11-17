{
  self,
  inputs,
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    pkgs-by-name = {
      type = "github";
      owner = "drupol";
      repo = "pkgs-by-name-for-flake-parts";
    };
    # keep-sorted end
  };

  imports = [
    inputs.pkgs-by-name.flakeModule
  ];

  zen.flake-parts.default = {
    root-parts =
      {
        config,
        system,
        ...
      }:
      {
        pkgsDirectory = "${self}/packages";
        pkgsNameSeparator = "-";

        _module.args = {
          pkgs = import inputs.nixpkgs {
            inherit
              system
              ;

            config.allowUnfree = true;
            overlays = [
              (_new: _prev: {
                self = self;
                system = system;
                local = config.packages;
              })
            ]
            ++ self.overlayPkgs;
          };
        };
      };
  };

  zen.flake-system.default = {
    includes = [ zen.custom.overlays ];
  };
}
