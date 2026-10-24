{
  zen,
  ...
}:

{
  zen.games.nixcraft.homestead = {
    includes = [
      zen.games.nixcraft
    ];

    homeManagerNixos =
      {
        pkgs,
        ...
      }:
      {
        nixcraft.client.instances = {
          "Homestead" = {
            # enableFeralGameMode = true;

            version = "1.20.1";

            mrpack = {
              enable = true;

              file = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/6HvKwSky/versions/I59aPn2B/Homestead%202.0.mrpack";
                hash = "sha256-GBOr4EC+jBa0D6FuEpjT57mzIV2xnDTv765inEQjKqM=";
              };
            };

            java.package = pkgs.temurin-jre-bin-17;
          };
        };
      };
  };
}
