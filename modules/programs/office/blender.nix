{
  ...
}:

{
  zen.programs.office.blender = {
    description = ''
      very powerful models crafter
      and goon video montage
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        package = pkgs.blender.withPackages (_packages: [ ]);
        version = package.version;

        # https://github.com/nix-community/stylix/blob/master/modules/blender/hm.nix
        indent = string: "  " + ((lib.splitString "\n" string) |> lib.concatStringsSep "\n  ");
      in
      {
        home.packages = package |> lib.singleton;

        xdg.configFile = {
          "blender/${version}/scripts/presets/interface_theme/Stylix.xml".text =
            [
              "<bpy>"
              (indent config.stylix.targets.blender.themeBody)
              "<bpy>"
            ]
            |> lib.concatLines;
        };

        xdg.mimeApps = {
          defaultApplicationPackages = package |> lib.singleton;
        };
      };
  };
}
