{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nixcraft = {
      type = "github";
      owner = "loystonpais";
      repo = "nixcraft";
    };
    # keep-sorted end
  };

  zen.games.nixcraft = {
    description = ''
      declarative minecraft settings, eto pizdec
    '';

    homeManagerNixos =
      {
        inputs,
        config,
        ...
      }:
      let
        meta = zen.games.minecraft.meta;
      in
      {
        imports = [
          inputs.nixcraft.homeModules.default
        ];

        nixcraft = {
          enable = true;

          client.shared = {
            binEntry.enable = true;
            desktopEntry.enable = true;

            enableExternalAssets = true;
            placeFilesAtActivation = true;

            account = {
              inherit (meta)
                username
                uuid
                ;
            };

            files."screenshots".source =
              config.lib.file.mkOutOfStoreSymlink "${config.xdg.userDirs.pictures}/Minecraft";

            java = {
              maxMemory = 8192;
              minMemory = 512;

              extraArguments = [
                "-XX:+UseZGC"
              ];
            };
          };
        };
      };
  };
}
