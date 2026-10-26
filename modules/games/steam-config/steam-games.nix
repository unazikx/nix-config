{
  ...
}:

{
  zen.games.steam-config.steam-games = {
    description = ''
      list of variables for proton
      dwproton: https://dawn.wine/dawn-winery/dwproton#runtime-config-options
      proton-ge: https://github.com/gloriouseggroll/proton-ge-custom#options
    '';

    homeManagerNixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        programs.steam.config = {
          apps =
            {
              # keep-sorted start block=yes newline_separated=yes
              "100" = {
                name = "Counter Strike: Condition Zero - Deleted Scenes";
              };

              "1000410" = {
                name = "Wrath: Aeon of Ruin";
              };

              "1030300" = {
                name = "Hollow Knight: Silksong";
              };

              "1030830" = {
                name = "Mafia II: Definitive Edition";
                language = "russian";
              };

              "1030840" = {
                name = "Mafia: Definitive Edition";
                language = "russian";
              };

              "1038300" = {
                name = "New Super Lucky's Tale";
              };

              "105600" = {
                name = "Terraria";
              };

              "1057090" = {
                name = "Ori and the Will of the Wisps";
              };

              "1084020" = {
                name = "Theotown";
              };

              "108600" = {
                name = "Project Zomboid";
              };

              "1086940" = {
                name = "Baldurs Gate 3";
                language = "russian";
              };

              "1118520" = {
                name = "Paralives";
              };

              "1127400" = {
                name = "Mindustry";
              };

              "1145360" = {
                name = "Hades";
              };

              "1150760" = {
                name = "Gloomwood";
              };

              "1154810" = {
                name = "Going Under";
                language = "russian";
              };

              "1167630" = {
                name = "Teardown";
              };

              "1169040" = {
                name = "Necesse";
                language = "russian";
              };

              "1209490" = {
                name = "Exit The Gungeon";
              };

              "1222680" = {
                name = "Need For Speed: Heat";
                language = "russian";
              };

              "1238080" = {
                name = "Burnout Paradise: Remastered";
                language = "russian";
                args = [ "-skipvideos" ];
              };

              "1244950" = {
                name = "Battletoads";
                language = "russian";
              };

              "1262540" = {
                name = "Need For Speed";
                language = "russian";
              };

              "1262580" = {
                name = "Need For Speed: Payback";
                compatTool = "proton_experimental";
                language = "russian";
                env.PROTON_EAC_RUNTIME = 1;
                args = [ "-skip-launcher" ];
              };

              "1296360" = {
                name = "Archvale";
              };

              "1304680" = {
                name = "Voidigo";
              };

              "1318690" = {
                name = "Shapez";
              };

              "1326470" = {
                name = "Sons Of The Forest";
              };

              "1337520" = {
                name = "Risk of Rain: Returns";
                language = "russian";
              };

              "1390190" = {
                name = "Apico";
              };

              "1390350" = {
                name = "Webbed";
                language = "russian";
              };

              "1433340" = {
                name = "Happy Humble Burger Farm";
              };

              "1484720" = {
                name = "Dead Estate";
              };

              "1486630" = {
                name = "Intravenous";
              };

              "1522870" = {
                name = "Supraland Six Inches Under";
              };

              "1544360" = {
                name = "LEGO: Builders Journey";
              };

              "155710" = {
                name = "One Million Fatal Guns";
              };

              "1574240" = {
                name = "Dread Delusion";
              };

              "1578650" = {
                name = "Citizen Sleeper";
              };

              "1591520" = {
                name = "Clownfield";
              };

              "1592280" = {
                name = "Selaco";
              };

              "1621690" = {
                name = "Core Keeper";
              };

              "1640300" = {
                name = "Project Warlock 2";
              };

              "1657630" = {
                name = "Slime Rancher 2";
              };

              "1663220" = {
                name = "Coffee Talk 2";
              };

              "1665260" = {
                name = "Beyond Sunset";
                wrappers = lib.mkAfter [
                  (lib.getExe pkgs.gzdoom)
                  "-iwad"
                ];
              };

              "1672970" = {
                name = "Minecraft Dungeons";
              };

              "1762930" = {
                name = "Goat Simulator Remastered";
              };

              "1898290" = {
                name = "LEGO: Bricktales";
                language = "russian";
              };

              "1902940" = {
                name = "Snacktorio";
              };

              "1903620" = {
                name = "Killer Frequency";
                language = "russian";
              };

              "1928870" = {
                name = "Minecraft Legends";
              };

              "1963510" = {
                name = "Herald of Havoc";
              };

              "1969810" = {
                name = "Enter The Chronosphere";
              };

              "1986840" = {
                name = "FNAF Popgoes";
              };

              "1996010" = {
                name = "Crow Country";
              };

              "200170" = {
                name = "Worms: Revolution";
                language = "russian";
              };

              "200260" = {
                name = "Batman: Arkham City";
              };

              "2005010" = {
                name = "Warhammer 40.000: Boltgun";
              };

              "200710" = {
                name = "Torchlight II";
              };

              "203140" = {
                name = "Hitman: Absolution";
                language = "russian";
              };

              "2085540" = {
                name = "Stick It to the Stickman";
                language = "russian";
              };

              "208650" = {
                name = "Batman: Arkham Knight";
              };

              "2100" = {
                name = "Dark Messiah of Might & Magic";
              };

              "211820" = {
                name = "Starbound";
              };

              "2124120" = {
                name = "SULFUR";
              };

              "214170" = {
                name = "Divine Divinity";
                language = "russian";
              };

              "2162800" = {
                name = "Shapez 2 - factory";
              };

              "219760" = {
                name = "Beyond Divinity";
                language = "russian";
              };

              "219780" = {
                name = "Divinity: 2 - Developer's Cut";
                language = "russian";
              };

              "219990" = {
                name = "Grim Dawn";
              };

              "2212330" = {
                name = "Your Only Move is Hustle";
              };

              "22320" = {
                name = "The Elder Scrolls III: Morrowind";
              };

              "22330" = {
                name = "The Elder Scrolls IV: Oblivion";
              };

              "22600" = {
                name = "Worms: Reloaded";
                language = "russian";
              };

              "2285550" = {
                name = "Doloc Town";
              };

              "2310" = {
                name = "Quake";
                language = "russian";
              };

              "2355150" = {
                name = "Midbourne";
              };

              "236450" = {
                name = "Pac-Man: Championship Edition DX+";
                language = "russian";
              };

              "2379780" = {
                name = "Balatro";
                language = "russian";
              };

              "238010" = {
                name = "Deus Ex: Human Revolution";
                language = "russian";
              };

              "239140" = {
                name = "Dying Light";
                language = "russian";
              };

              "242760" = {
                name = "The Forest";
              };

              "243470" = {
                name = "Watch Dogs";
                language = "russian";
              };

              "2436940" = {
                name = "Sephiria";
              };

              "2442460" = {
                name = "Citizen Sleeper 2";
              };

              "248820" = {
                name = "Risk of Rain (2013)";
              };

              "249130" = {
                name = "LEGO: Marvel Super Heroes";
                language = "russian";
              };

              "250900" = {
                name = "The Binding Of Isaac: Rebirth";
              };

              "2533960" = {
                name = "SUMMERHOUSE";
              };

              "257850" = {
                name = "Hyper Light Drifter";
              };

              "258180" = {
                name = "Deus Ex: The Fall";
                language = "russian";
              };

              "2608270" = {
                name = "Intravenous 2";
              };

              "261570" = {
                name = "Ori and the Blind Forest";
                language = "russian";
              };

              "2617700" = {
                name = "Tinkerlands";
                files = {
                  prefix.patch = {
                    "drive_c/users/steamuser/AppData/Local/Tinkerlands/useroptions.conf" = {
                      format = "json";
                      content = {
                        language = 9.0; # russian
                      };
                    };
                  };
                };
              };

              "2629230" = {
                name = "Adventures Of Sir Kicksalot";
              };

              "264710" = {
                name = "Subnautica";
              };

              "2660970" = {
                name = "Hypersomnia";
              };

              "268910" = {
                name = "Cuphead";
              };

              "2710040" = {
                name = "Delverium";
              };

              "2737300" = {
                name = "Parking Garage Rally Circuit";
              };

              "275850" = {
                name = "No Man's Sky";
                language = "russian";
              };

              "2764460" = {
                name = "Sandustry";
              };

              "2873080" = {
                name = "Noexistence You Me";
              };

              "2904040" = {
                name = "Cheap Car Repair";
              };

              "292030" = {
                name = "The Witcher 3";
                language = "russian";
              };

              "298630" = {
                name = "The Escapists";
                language = "russian";
              };

              "305620" = {
                name = "The Long Dark";
              };

              "307690" = {
                name = "Sleeping Dogs";
                language = "russian";
              };

              "3108510" = {
                name = "FlyKnight";
              };

              "311690" = {
                name = "Enter The Gungeon";
                language = "russian";
              };

              "312530" = {
                # https://www.protondb.com/app/312530#VBbR6m5Ilw
                name = "Duck Game";
                compatTool = "proton_8";
              };

              "313690" = {
                name = "LEGO: Batman Beyond Gotham";
              };

              "3161220" = {
                name = "Coffee Talk Tokyo";
              };

              "321400" = {
                name = "Supraball";
              };

              "3214610" = {
                name = "Cinderia";
              };

              "3214660" = {
                name = "REPO";
              };

              "322330" = {
                name = "Dont Starve Together";
              };

              "322500" = {
                name = "SUPERHOT";
              };

              "325210" = {
                name = "Arctico";
              };

              "327030" = {
                name = "Worms: WMD";
                language = "russian";
              };

              "3293010" = {
                name = "Easy Delivery Co";
              };

              "332310" = {
                name = "LEGO: Worlds";
                language = "russian";
              };

              "3363200" = {
                name = "Midnight Snack";
              };

              "337000" = {
                name = "Deus Ex: Mankid Divided";
                language = "russian";
              };

              "3405340" = {
                name = "Megabonk";
                language = "russian";
              };

              "3417410" = {
                name = "Storebound";
                winetricks = [ "vcrun2022" ];
              };

              "3453910" = {
                name = "Happy Humble Burger Cult";
              };

              "3495730" = {
                name = "Lucid Blocks";
              };

              "3497800" = {
                name = "Bonehold";
              };

              "3509230" = {
                name = "Gambonanza";
              };

              "35140" = {
                name = "Batman: Arkham Asylum";
              };

              "3516590" = {
                name = "Allumeria";
              };

              "359320" = {
                name = "Elite Dangerous";
                language = "russian";
              };

              "360430" = {
                name = "Mafia III: Definitive Edition";
                language = "russian";
              };

              "361420" = {
                name = "ASTRONEER";
              };

              "367520" = {
                name = "Hollow Knight";
              };

              "3690030" = {
                name = "The Last Gas Station";
              };

              "371970" = {
                name = "Barony";
                compatTool = null;
                betaBranch = "translation-fix";
              };

              "373420" = {
                name = "Divinity: Original Sin";
                language = "russian";
              };

              "3771740" = {
                name = "Iq Under Construction";
              };

              "3808690" = {
                name = "Pathogenic";
                compatTool = null;
              };

              "387290" = {
                name = "Ori and the Blind Forest - Definitive Edition";
                language = "russian";
              };

              "388410" = {
                name = "Darksiders II Deathinitive Edition";
                language = "russian";
              };

              "4000" = {
                name = "Garrys Mod";
                betaBranch = "x86-64";
              };

              "4075620" = {
                name = "Combolands";
              };

              "41500" = {
                name = "Torchlight";
              };

              "4164420" = {
                name = "My Winter Car";
              };

              "427410" = {
                name = "Abiotic Factor";
              };

              "427520" = {
                name = "Factorio";
                language = "russian";
              };

              "4304900" = {
                name = "Big Dig"; # BIG DICK???????
                language = "russian";
              };

              "431240" = {
                name = "Golf with Your Friends";
                compatTool = null;
                language = "russian";
              };

              "433340" = {
                name = "Slime Rancher";
              };

              "435150" = {
                name = "Divinity: Original Sin 2";
                language = "russian";
              };

              "446020" = {
                name = "Jalopy";
              };

              "448510" = {
                name = "Overcooked";
              };

              "4487840" = {
                name = "Hard Truck 2";
                language = "russian";
              };

              "4508340" = {
                name = "NTE: Neverness to Everness";
              };

              "460920" = {
                name = "Steep";
                language = "russian";
              };

              "462780" = {
                name = "Darksiders Warmastered Edition";
                language = "russian";
              };

              "4890770" = {
                name = "Intravenous: Borderline";
              };

              "489830" = {
                name = "The Elder Scrolls V: Skyrim";
                language = "russian";
              };

              "490640" = {
                name = "Plastic Warfare";
              };

              "493490" = {
                name = "City Car Driving";
                compatTool = "proton_8";
              };

              "4963920" = {
                name = "Porthole";
                language = "russian";
              };

              "4986460" = {
                name = "EthrA (playtest)";
              };

              "50130" = {
                name = "Mafia II (Classic)";
                language = "russian";
              };

              "501590" = {
                name = "Bulletstorm";
                language = "russian";
              };

              "505170" = {
                name = "Carmageddon Max Damage";
                language = "russian";
              };

              "50620" = {
                name = "Darksiders";
                language = "russian";
              };

              "508440" = {
                name = "TABS";
              };

              "512900" = {
                name = "Streets Of Rouge";
                language = "russian";
              };

              "516750" = {
                name = "My Summer Car";
              };

              "519860" = {
                name = "Dusk";
                language = "russian";
              };

              "5228920" = {
                name = "Brick by Brick";
                language = "russian";
              };

              "526870" = {
                name = "Satisfactory";
              };

              "5331850" = {
                name = "FLYBRAIN LAB";
                language = "russian";
              };

              "562860" = {
                name = "Ion Fury";
              };

              "571740" = {
                name = "Golf It!";
                language = "russian";
              };

              "578330" = {
                name = "LEGO: City Undercover";
                language = "russian";
              };

              "588650" = {
                name = "Dead Cells";
                language = "russian";
              };

              "590830" = {
                name = "S&box";
              };

              "599140" = {
                name = "Graveyard Keeper";
              };

              "606150" = {
                name = "Moonlighter";
                compatTool = null;
                language = "russian";
              };

              "606280" = {
                name = "Darksiders III";
                language = "russian";
              };

              "615530" = {
                name = "Love, Money, Rock'n'Roll";
                language = "russian";
              };

              "629820" = {
                name = "Maneater";
                language = "russian";
              };

              "630720" = {
                name = "Mana Spark";
              };

              "632360" = {
                name = "Risk of Rain 2";
                language = "russian";
              };

              "632470" = {
                name = "Disco Elysium";
                language = "russian";
              };

              "640340" = {
                name = "Serious Sam Tormental";
              };

              "641990" = {
                name = "The Escapists 2";
                language = "russian";
              };

              "647830" = {
                name = "LEGO: Marvel Super Heroes 2";
                language = "russian";
              };

              "673880" = {
                name = "Warhammer 40.000: Mechanicus";
                language = "russian";
              };

              "674940" = {
                name = "Stick Fight: The Game";
              };

              "678960" = {
                name = "Code Vein";
              };

              "6860" = {
                name = "Hitman: Blood Money";
              };

              "690040" = {
                name = "SUPERHOT: MIND CONTROL DELETE";
              };

              "6910" = {
                name = "Deus Ex: GOTY";
              };

              "6920" = {
                name = "Deus Ex: Invisible War";
              };

              "70600" = {
                name = "Worms: Ultimate Mayhem";
              };

              "710920" = {
                name = "Darksiders Genesis";
              };

              "728880" = {
                name = "Overcooked 2";
                language = "russian";
              };

              "738520" = {
                name = "Breathedge";
                language = "russian";
              };

              "751780" = {
                name = "Forager";
              };

              "758870" = {
                name = "Kynseed";
              };

              "775500" = {
                name = "Scarlet Nexus";
                compatTool = "proton_8";
                language = "russian";
              };

              "80" = {
                name = "Counter Strike: Condition Zero";
              };

              "813630" = {
                name = "Supraland";
              };

              "821250" = {
                name = "Flotsam";
              };

              "824600" = {
                name = "Hrot";
              };

              "828740" = {
                name = "Tales of the Neon Sea";
              };

              "829110" = {
                name = "LEGO: DC Super Villains";
                language = "russian";
              };

              "837470" = {
                name = "Untitled Goose Game";
              };

              "847360" = {
                name = "Super Lucky's Tale";
              };

              "847370" = {
                name = "Sunset Overdrive";
                language = "russian";
              };

              "848450" = {
                name = "Subnautica: Below Zero";
              };

              "858710" = {
                name = "Gravity Circuit";
              };

              "870780" = {
                name = "Control Ultimate Edition";
              };

              "881100" = {
                name = "Noita";
              };

              "892970" = {
                name = "Valheim";
              };

              "894020" = {
                name = "Death's Door";
              };

              "897450" = {
                name = "The Survivalists";
                language = "russian";
              };

              "914800" = {
                name = "Coffee Talk";
              };

              "920210" = {
                name = "LEGO: Star Wars The Skywalker Saga";
                language = "russian";
              };

              "932850" = {
                name = "Simmiland";
              };

              "962130" = {
                name = "Groundedr";
              };

              "962580" = {
                name = "Summer In Mara";
              };

              "978300" = {
                name = "Saints Row: The Third Remastered";
                language = "russian";
              };

              "979110" = {
                name = "Space Haven";
              };
              # keep-sorted end
            }
            |> lib.mkGames {
              allowDownloadsWhileRunning = "always" |> lib.mkDefault;
            };
        };
      };
  };
}
