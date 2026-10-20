{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nix-obsidian-extensions = {
      type = "github";
      owner = "karaolidis";
      repo = "nix-obsidian-extensions";
    };
    # keep-sorted end
  };

  zen.programs.editors.obsidian = {
    description = ''
      good markdown note keeper
    '';

    homeManagerNixos =
      {
        inputs,
        ...
      }:
      {
        programs.obsidian = {
          enable = true;
          cli.enable = true;
        };

        nixpkgs.overlays = [
          inputs.nix-obsidian-extensions.overlays.default
        ];
      };
  };
}
