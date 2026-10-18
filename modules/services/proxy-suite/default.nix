{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    proxy-suite-flake = {
      type = "github";
      owner = "unazikx";
      repo = "proxy-suite-flake";
    };
    # keep-sorted end
  };

  zen.services.proxy-suite = {
    description = ''
      bundles sing-box,
      zapret-discord-youtube,
      and tg-ws-proxy
    '';

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [
          inputs.proxy-suite-flake.nixosModules.default
        ];

        services.proxy-suite = {
          enable = true;
        };
      };
  };
}
