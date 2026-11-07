{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   vicinae-extensions = {
  #     type = "github";
  #     owner = "vicinaehq";
  #     repo = "extensions";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.vicinae = {
    description = ''
      raycast like launcher
    '';

    homeManager =
      {
        inputs',
        pkgs,
        config,
        ...
      }:
      let
        extensions = inputs'.vicinae-extensions.packages;
      in
      {
        programs.vicinae = {
          enable = true;
          package = pkgs.vicinae;

          settings = {
            # launcher_window = {
            #   compact_mode = {
            #     enabled = true;
            #   };
            # };

            pop_on_backspace = true;

            providers = {
              "@knoopx/vicinae-extension-firefox-0" = {
                preferences.profile_dir = config.programs.librewolf.configPath;
              };

              "@sei40kr/vicinae-extension-wikipedia-0" = {
                preferences.viewType = "grid";
              };
            };
          };

          extensions = [
            # keep-sorted start block=yes
            extensions.bitwarden
            extensions.color-converter
            extensions.firefox
            extensions.keepassxc
            extensions.player-pilot
            extensions.protondb-search
            extensions.pulseaudio
            extensions.timer
            extensions.zoxide-recent-directories
            # keep-sorted end

            # https://www.raycast.com/store
            # keep-sorted start block=yes newline_separated=yes
            # (config.lib.vicinae.mkRayCastExtension {
            #   name = "youtube";
            #   src = "${inputs.raycast-extensions}/extensions/youtube";
            # })
            # keep-sorted end
          ];

          systemd = {
            enable = true;
            autoStart = true;
          };
        };
      };
  };
}
