{
  ...
}:

{
  zen.users.hackerx = {
    homeManager =
      {
        ...
      }:
      {
        programs.git = {
          signing.key = "~/.ssh/id_ed25519_sk_rk_signer.pub";
        };

        programs.ssh.settings = {
          "github.com" = {
            identityFile = [ "~/.ssh/id_ed25519_sk_rk_github" ];
          };
        };
      };
  };
}
