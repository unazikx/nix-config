{
  zen,
  ...
}:

{
  zen.services.proxy-suite.proxy = {
    includes = [
      zen.services.proxy-suite.tg-ws-proxy
    ];

    nixos =
      {
        ...
      }:
      {
        services.proxy-suite = {
          proxy = {
            enable = true;
          };
        };
      };
  };
}
