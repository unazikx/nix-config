{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    dns-malw-link = {
      type = "github";
      owner = "immalware";
      repo = "dns.malw.link";
      flake = false;
    };
    # keep-sorted end
  };

  zen.hardware.networking.dns-malw-link = {
    description = ''
      modified dns malw link hosts file

      use module like:
      (zen.networking.hosts [ "api.github.com" ])
    '';

    nixos =
      {
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        networking.hostFiles =
          (pkgs.runCommandLocal "dns-malw-link-hosts.txt"
            {
              source = "${inputs.dns-malw-link}/hosts";

              meta = {
                description = "DNS-server + SNI-proxy thats bypass blocks";
                homepage = "https://github.com/ImMALWARE/dns.malw.link";
                license = lib.licenses.mit;
              };
            }
            ''
              sed ${
                [
                  "api.github.com"
                ]
                |> lib.escapeDomains
              } $source > $out
            ''
          )
          |> lib.singleton;

        # networking.hostFiles = "${inputs.dns-malw-link}/hosts" |> lib.singleton;
      };
  };
}
