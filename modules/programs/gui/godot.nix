{
  ...
}:

{
  zen.programs.gui.godot = {
    description = ''
      game engine
      works on GDScript and C#
    '';

    homeManager =
      {
        pkgs,
        lib,
        ...
      }:
      let
        package = pkgs.godot-mono;
      in
      {
        home.packages = package |> lib.singleton;

        xdg.mimeApps = {
          defaultApplicationPackages = package |> lib.singleton;
        };
      };
  };
}
