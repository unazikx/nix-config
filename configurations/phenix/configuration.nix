{
  zen,
  ...
}:

{
  den.hosts.phenix = {
    system = "x86_64-linux";
    class = "finix";

    users.jeensgrys = {
      classes = [ "hjem" ];
    };
  };

  zen.hosts.phenix = {
    includes = [
      zen.miscellaneous.nix
      zen.miscellaneous.minimal
      zen.hardware.security.sudo
    ];
  };

  zen.users.jeensgrys = {
    includes = [ ];
  };
}
