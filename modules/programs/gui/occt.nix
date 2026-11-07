{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   occt-nix = {
  #     type = "github";
  #     owner = "daaboulex";
  #     repo = "occt-nix";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #     inputs.flake-parts.follows = "flake-parts";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.occt = {
    description = ''
      all-in-one software used to:
      stress test, benchmark, and pc hardware stability
    '';

    includes = [
      zen.custom.occt
    ];

    homeManagerNixos =
      {
        inputs',
        pkgs,
        ...
      }:
      {
        programs.occt = {
          enable = true;

          package = inputs'.occt-nix.packages.occt.overrideAttrs {
            # ocbase doesnt pin versions
            # only rolling
            version = "rolling";

            # ┃ error: hash mismatch in fixed-output derivation '/nix/store/2nw7rzcfrfbyz15hpalxk2nk44jln076-branch-Stable.drv':
            # ┃          specified: sha256-enzdar1UlJDI02waM2WzVCpXgmxrbt0Dn9AUdHV1WYc=
            # ┃             got:    sha256-E9b5QIJADoHYNFdN67wmvW6QPH0TjzXaIOgDVOJq+Hc=
            src = pkgs.fetchurl {
              url = "https://www.ocbase.com/download-bin/edition:Personal/os:Linux/branch:Stable";
              sha256 = "sha256-E9b5QIJADoHYNFdN67wmvW6QPH0TjzXaIOgDVOJq+Hc=";
            };
          };

          disableUpdates = true;
        };
      };
  };
}
