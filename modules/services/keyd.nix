{
  ...
}:

{
  zen.services.keyd = {
    description = ''
      remap actions to any other action
    '';

    nixos =
      {
        ...
      }:
      {
        services.keyd = {
          enable = true;

          keyboards = {
            default = {
              ids = [ "*" ];
              settings = {
                main = {
                  hangupphone = "nextsong";
                  pickupphone = "playpause";
                  favorites = "screenlock";
                };
              };
            };
          };
        };
      };
  };
}
