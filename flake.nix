{
  outputs =
    _:
    let
      self = ./.;
      sources = import "${self}/.tack";

      with-inputs = import sources.with-inputs;

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
    (with-inputs.from.tack self) { } outputs;

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
