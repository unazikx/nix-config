{
  outputs =
    _:
    let
      self = ./.;
      lonDir = "${self}/.lon";

      sources = import "${lonDir}/lon.nix";
      follows = import "${lonDir}/lon-follows.nix";
      with-inputs = import sources.with-inputs;

      builder = with-inputs.from.lon' self ".lon";

      outputs =
        inputs:
        (inputs.flake-parts.lib.mkFlake
          {
            inherit inputs;
          }
          (
            [
              ./configurations
              ./modules
            ]
            |> inputs.import-tree
          )
        );
    in
    builder follows outputs;

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
