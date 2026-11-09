{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    wayswitch = {
      type = "github";
      owner = "wetoshkin";
      repo = "wayswitch";
      flake = false; # yet
    };
    # keep-sorted end
  };

  zen.programs.desktop.wayswitch = {
    description = ''
      auto corrector for EN -> RU
    '';

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          "${inputs.wayswitch}/packaging/nix/module.nix"
        ];

        services.wayswitch = {
          enable = true;
        };
      };

    homeManagerNixos =
      {
        pkgs,
        lib,
        ...
      }:
      let
        toml = pkgs.formats.toml { };
      in
      {
        xdg.configFile = {
          "wayswitch/config.toml".source = toml.generate "wayswitch-config.toml" {
            general = {
              auto_correct = false;
              caps_fix = true;
              check_updates = false;
              early_switch = true;
              edit_guard_sec = 1.0;
              fix_on_enter = false;
              fix_on_tab = false;
              learn_after_undos = 2;
              particles_fix = true;
              phrase_timeout_sec = 8.0;
              punct_fix = true;
              sensitivity = "aggressive";
              skip_password_fields = true;
              sound_on_fix = false;
              split_words_fix = true;
              two_capitals_fix = true;
              undo_window_sec = 5.0;
            };

            gesture = {
              manual = "double_shift";
              numbers_key = "";
              pause_hotkey = "";
              selection_key = "";
              tap_key = "leftctrl";
              translit_key = "";
            };

            typing = {
              key_delay_ms = 0;
              settle_ms = 120;
            };

            backend = {
              prefer = "auto";
              shell_typing = "extension";
              track_hotkey = false;
            };
          };

          "wayswitch/exceptions.txt".text = lib.concatStringsSep "\n" [ ];
        };
      };
  };
}
