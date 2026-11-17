{
  zen,
  ...
}:

{
  zen.games.minecraft = {
    meta = {
      # https://mcuuid.net/?q=username
      uuid = "e6074fe1-b0d5-4394-a860-c84987c52d9a";
      username = "_azikx";

      defaultJRE = pkgs: pkgs.temurin-jre-bin-25;

      temurinJRE = pkgs: [
        # its all LTS
        # https://adoptium.net/temurin/releases
        #
        # keep-sorted start
        pkgs.temurin-jre-bin-17
        pkgs.temurin-jre-bin-21
        pkgs.temurin-jre-bin-25
        pkgs.temurin-jre-bin-8
        # keep-sorted end
      ];
    };

    wiki = {
      "Minecraft Modpacks" = {
        extra = ''
          my modrinth lists with good modpacks:
          https://modrinth.com/collection/dB2Obqjo
        '';

        links = [
          {
            name = "minecraft-wiki";
            link = "https://minecraft.wiki";
            logo = "https://minecraft.wiki/images/Wiki.png";
          }
          {
            name = "eternal-fire-studio";
            link = "https://boosty.to/rein1_modpacks";
            logo = "https://images.boosty.to/user/25844628/avatar";
          }
          {
            name = "vortex";
            link = "https://vrtx.su";
            logo = "https://vrtx.su/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.2skjwur5alw0-.png&w=64&q=75";
          }
          {
            name = "terra-firma-greg";
            link = "https://terrafirmagreg.team";
            logo = "https://terrafirmagreg.team/storage/img/64x-256p-tfg-logo-v4.gif";
          }
          {
            name = "homestead";
            link = "https://modrinth.com/modpack/homestead";
            logo = "https://cdn.modrinth.com/data/6HvKwSky/d100be12ed4f630466412f805e068da29b6e4898_96.webp";
          }
          {
            name = "cabin";
            link = "https://www.curseforge.com/minecraft/modpacks/cabin";
            logo = "https://media.forgecdn.net/avatars/thumbnails/899/846/256/256/638346046780138525.png";
          }
          {
            name = "freshcraft";
            link = "https://freshcraft.org/modpacks";
            logo = "https://freshcraft.org/images/logo.png";
          }
          {
            name = "craftoria";
            link = "https://www.curseforge.com/minecraft/modpacks/craftoria";
            logo = "https://media.forgecdn.net/avatars/thumbnails/1066/473/256/256/638600434802547442.png";
          }
        ];
      };
    };
  };

  zen.flake-parts.default = {
    includes = [ zen.games.minecraft ];
  };
}
