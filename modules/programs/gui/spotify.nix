{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   spicetify-nix = {
  #     type = "github";
  #     owner = "gerg-l";
  #     repo = "spicetify-nix";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.spotify = {
    description = ''
      idk how to login, i am via ~~dns.malw.link~~
      okay... sometimes via vpn lol
      okay... ... ... Russia man... blocks ye
      okay... i just bought subscription
      yeeee...meh

      expires 04.09.2026
    '';

    homeManager =
      {
        inputs,
        inputs',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
        spicetify = inputs'.spicetify-nix.legacyPackages;
      in
      {
        imports = [
          inputs.spicetify-nix.homeManagerModules.spicetify
        ];

        programs.spicetify = {
          enable = true;

          alwaysEnableDevTools = true;
          windowManagerPatch = true;
          wayland = true;

          theme = spicetify.themes.sleek // {
            additionalCss =
              # css
              ''
                * {
                  font-family: "${config.stylix.fonts.sansSerif.name}" !important
                }
              '';
          };

          enabledExtensions = [
            # keep-sorted start
            spicetify.extensions.adblock
            spicetify.extensions.keyboardShortcut
            spicetify.extensions.madeForYouShortcut
            spicetify.extensions.queueTime
            # keep-sorted end
          ];

          enabledSnippets = [
            # keep-sorted start
            spicetify.snippets.betterLyricsStyle
            spicetify.snippets.centeredLyrics
            spicetify.snippets.fixDjIcon
            spicetify.snippets.fixLikedButton
            spicetify.snippets.fixLikedIcon
            spicetify.snippets.fixNowPlayingIcon
            spicetify.snippets.fixPlaylistAndFolderPosition
            spicetify.snippets.fixPlaylistHover
            spicetify.snippets.fixProgressBar
            spicetify.snippets.fixedEpisodesIcon
            spicetify.snippets.hideDownloadButton
            spicetify.snippets.hideFriendActivityButton
            spicetify.snippets.hideFullScreenButton
            spicetify.snippets.hideMiniPlayerButton
            spicetify.snippets.hideNowPlayingViewButton
            spicetify.snippets.hidePlayCount
            spicetify.snippets.hidePlayingGif
            spicetify.snippets.hideProfileUsername
            spicetify.snippets.hideSidebarScrollbar
            spicetify.snippets.moreVisibleUnplayableTracks
            spicetify.snippets.prettyLyrics
            spicetify.snippets.queueTopSidePanel
            spicetify.snippets.removeGradient
            spicetify.snippets.removeTheArtistsAndCreditsSectionsFromTheSidebar
            spicetify.snippets.removeTopSpacing
            spicetify.snippets.roundedImages
            spicetify.snippets.roundedNowPlaying
            # keep-sorted end
          ];

          colorScheme = "custom";
          customColorScheme = {
            # keep-sorted start
            accent = colors.base03;
            accent-active = colors.base03;
            accent-inactive = colors.base02;
            banner = colors.base03;
            border-active = colors.base03;
            border-inactive = colors.base03;
            button = colors.base0B;
            button-active = colors.base0B;
            button-disabled = colors.base03;
            card = colors.base00;
            equalizer = colors.base0B;
            header = colors.base00;
            highlight = colors.base04;
            highlight-elevated = colors.base03;
            main = colors.base00;
            main-elevated = colors.base02;
            misc = colors.base02;
            notification = colors.base0A;
            notification-error = colors.base08;
            player = colors.base00;
            selected-row = colors.base03;
            shadow = colors.base00;
            sidebar = colors.base01;
            sidebar-text = colors.base07;
            subtext = colors.base06;
            tab-active = colors.base04;
            text = colors.base06;
            # keep-sorted end
          };
        };

        stylix.targets = {
          spicetify.enable = false;
        };
      };
  };
}
