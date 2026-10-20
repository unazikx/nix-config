{
  outputs =
    _:
    let
      self = ./.;
      lonDir = "${self}/.lon";

      sources = import "${lonDir}/lon.nix";
      follows = import "${lonDir}/lon-follows.nix";

      with-inputs = import sources.with-inputs;

      outputs =
        inputs:
        (inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            inputs.import-tree [
              ./configurations
              ./modules
            ]
          )
        );
    in
    (with-inputs.from.lon' self ".lon") follows outputs;

  nixConfig = {
    accept-flake-config = true;
    warn-dirty = false;
    auto-optimise-store = true;
    builders-use-substitutes = true;

    extra-experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
  };
}
