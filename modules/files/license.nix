{
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        pkgs,
        lib,
        ...
      }:
      {
        files =
          {
            path = "license";
            drv = pkgs.writers.writeText "license" ''
              DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
              Version 2, December 2004

              Copyright (C) 2026 Azikx Kurbonov <xfalwa@gmail.com>

              Everyone is permitted to copy and distribute verbatim or modified
              copies of this license document, and changing it is allowed as long
              as the name is changed.

              DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
              TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

              0. You just DO WHAT THE FUCK YOU WANT TO.
            '';
          }
          |> lib.singleton;
      };
  };
}
