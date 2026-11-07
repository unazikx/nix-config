{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   amane = {
  #     type = "github";
  #     owner = "mystiafin";
  #     repo = "amane";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.amane = {
    description = ''
      modern desktop shell
      config in rust, scary
      fr fr fr
    '';

    includes = [
      zen.miscellaneous.users.accounts
    ];

    wiki = {
      "Amane" = {
        links = [
          {
            name = "amane-wiki";
            link = "https://mystiafin.github.io/amane";
            logo = "https://avatars.githubusercontent.com/u/137388364";
          }
        ];
      };
    };

    nixos =
      {
        ...
      }:
      { };

    homeManagerNixos =
      {
        inputs',
        ...
      }:
      {
        home.packages = [
          inputs'.amane.packages.default
        ];
      };
  };
}
