{
  install-nix = {
    name = "Install Nix";
    uses = "cachix/install-nix-action@v31";
    "with" = {
      nix_path = "nixpkgs=channel:nixos-unstable";
      extra_nix_config = ''
        accept-flake-config = true
        experimental-features = nix-command flakes pipe-operators
      '';
    };
  };
}
