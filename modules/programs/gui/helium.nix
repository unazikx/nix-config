{
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   helium-flake = {
  #     type = "gitlab";
  #     owner = "ntgn";
  #     repo = "helium-flake";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #     inputs.flake-parts.follows = "flake-parts";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.gui.helium = {
    description = ''
      chromium based distro
      idk what say also
    '';

    homeManagerNixos =
      {
        inputs,
        lib,
        osConfig,
        ...
      }:
      let
        glanceCfg = osConfig.services.glance;
      in
      {
        imports = [
          inputs.helium-flake.homeModules.helium
        ];

        programs.helium = {
          enable = true;

          extensions = [ ];

          extraPolicies = {
            HomepageLocation =
              if glanceCfg.enable then
                (
                  [
                    glanceCfg.settings.server.host
                    (toString glanceCfg.settings.server.port)
                  ]
                  |> lib.concatStringsSep ":"
                )
              else
                "https://start.duckduckgo.com";

            PasswordManagerEnabled = false;

            DeveloperToolsAvailability = 1;

            ManagedBookmarks = [
              {
                toplevel_name = "Nix Ecosystem";
              }
              {
                name = "Nix Packages";
                url = "https://search.nixos.org/packages";
              }
            ];
          };

          preferences = {
            browser.show_home_button = true;
            bookmark_bar.show_on_all_tabs = true;
          };
        };
      };
  };
}
