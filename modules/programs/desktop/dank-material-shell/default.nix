{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   dux-shell = {
  #     type = "github";
  #     owner = "duxlabs-dev";
  #     repo = "dux-shell";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };

  #   dux-plugins = {
  #     type = "github";
  #     owner = "duxlabs-dev";
  #     repo = "dux-plugin-registry";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.dux-shell = {
    description = ''
      modern clipboard with tofi frontend
      clipboard entries are in ~/.cache/clapboard
    '';

    includes = [
      # zen.programs.desktop.dank-material-shell.plugins
      zen.programs.desktop.dank-material-shell.settings
      zen.programs.desktop.dank-material-shell.theme
    ];

    homeManager =
      {
        inputs,
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.dux-plugins.homeModules.dms-plugin-registry
          inputs.dux-shell.homeModules.dank-material-shell
          inputs.dux-shell.homeModules.niri
        ];

        programs.dank-material-shell = {
          enable = true;
          systemd.enable = true;

          quickshell.package = pkgs.quickshell;

          # enabled features
          enableAudioWavelength = true;
          enableCalendarEvents = true;
          enableClipboardPaste = true;

          # disabled features
          enableDynamicTheming = false;
          enableSystemMonitoring = false;
          enableVPN = false;
        };
      };
  };
}
