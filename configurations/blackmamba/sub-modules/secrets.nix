{
  zen,
  ...
}:

{
  zen.hosts.blackmamba = {
    includes = [
      zen.miscellaneous.users
    ];

    nixos =
      {
        # self,
        # host,
        ...
      }:
      {
        # sops.defaultSopsFile = "${self}/secrets/${host.hostName}/sops.yaml";
      };
  };

  zen.users.hackerx = {
    homeManager =
      {
        # self,
        # host,
        ...
      }:
      {
        # sops.defaultSopsFile = "${self}/secrets/${host.hostName}/sops.yaml";
      };
  };
}
