{
  zen,
  lib,
  ...
}:

{
  zen.miscellaneous.nix.substituters = {
    meta = {
      substituters = lib.mkForce [
        "https://mirror.yandex.ru/nixos"
        "https://xache.cachix.org"
      ];

      trusted-public-keys = lib.mkForce [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "xache.cachix.org-1:InoMKnvFvDh+J5gFNHN1mmUONxvYJqFImLJY8/bl9YA="
      ];
    };
  }
  // (lib.genAttrs
    [
      "nixos"
      "homeManager"
    ]
    (
      _:
      let
        meta = zen.miscellaneous.nix.substituters.meta;
      in
      {
        nix.settings = {
          inherit (meta)
            substituters
            trusted-public-keys
            ;
        };
      }
    )
  )
  // {
    finix =
      {
        ...
      }:
      let
        meta = zen.miscellaneous.nix.substituters.meta;
      in
      {
        services.nix-daemon.settings = {
          inherit (meta)
            substituters
            trusted-public-keys
            ;
        };
      };
  };
}
