{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    qutebrowser-adblocks = {
      type = "github";
      owner = "afreakk";
      repo = "greasemonkeyscripts";
      flake = false;
    };

    qutebrowser-hdrezkaplus = {
      type = "github";
      owner = "chebaku";
      repo = "hdrezkaplus";
      ref = "TEST";
      flake = false;
    };
    # keep-sorted end
  };

  zen.programs.gui.qutebrowser = {
    description = ''
      ~~VERY UNSTABLE BROWSER~~

      okay its began stable
      very much shizocode
    '';

    includes = [
      zen.custom.qutebrowser
      zen.programs.gui.qutebrowser.bindings
      zen.programs.gui.qutebrowser.quickmarks
      zen.programs.gui.qutebrowser.rules
      zen.programs.gui.qutebrowser.settings
      zen.programs.gui.qutebrowser.theme
      zen.programs.gui.qutebrowser.userstyles
    ];

    homeManager =
      {
        inputs,
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.qutebrowser;
      in
      {
        programs.qutebrowser = {
          enable = true;

          # crash
          # package = self'.packages.qutebrowser-fido2;

          searchEngines =
            # PLEASE SORRY FOR REC
            rec # OOOOOOHHHH NOOOOO FUUUUUUUCCCCKKKK
            # PLEEEEEASEEEESESE SSSSOOOOORRRRRYYYYY
            {
              DEFAULT = google;
              # keep-sorted start
              anilist = "${cfg.quickmarks.anilist}/search?search={}";
              forget = "${cfg.quickmarks.forget}/web?s={}";
              github = "${cfg.quickmarks.github}/search?q={}";
              google = "${cfg.quickmarks.google}/search?q={}";
              nixpkgs = "${cfg.quickmarks.nixpkgs}&query={}";
              nixsearch = "${cfg.quickmarks.nixSearch}/?q={}";
              youtube = "${cfg.quickmarks.youtube}/results?search_query={}";
              # keep-sorted end
            };

          greasemonkey =
            let
              fromInputs = [
                # keep-sorted start
                "${inputs.qutebrowser-adblocks}/youtube_adblock.js"
                "${inputs.qutebrowser-adblocks}/youtube_shorts_block.js"
                "${inputs.qutebrowser-adblocks}/youtube_sponsorblock.js"
                "${inputs.qutebrowser-hdrezkaplus}/HdRezkaPlus.qtfix.user.js"
                # keep-sorted end
              ];
            in
            lib.flatten [
              (map (path: pkgs.writeText (baseNameOf path) (lib.readFile path)) fromInputs)
              # keep-sorted start block=yes newline_separated=yes
              (pkgs.fetchurl {
                url = "https://gist.githubusercontent.com/ilyhalight/6eb5bb4dffc7ca9e3c57d6933e2452f3/raw/7ab38af2228d0bed13912e503bc8a9ee4b11828d/gm-addstyle-polyfill.js";
                sha256 = "sha256-C4NkK3NGDV0XehzoStm0lTUVT6XUMy4app+vAFpxY0E=";
              })

              (pkgs.fetchurl {
                url = "https://raw.githubusercontent.com/Frestein/dotfiles/539243e801264a37442fc2e462b33099529e3d16/home/dot_config/private_qutebrowser/greasemonkey/youtube-sponsorblock.js";
                sha256 = "sha256-dJPPePmrVzm2fe0BJSaKuCORA7j2Tfly9STaegWWNDY=";
              })
              # keep-sorted end
            ];
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };

        nixpkgs.config.permittedInsecurePackages = [
          "qutebrowser-3.7.0"
        ];
      };
  };
}
