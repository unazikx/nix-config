{
  zen,
  ...
}:

{
  zen.secrets = {
    meta = {
      yubikey = "/var/lib/yubikey";

      defaultKeys = {
        personal = "age1yubikey1q2nd6ngwjcdkzw8yars7vsa7ljvy4x73xuev69cncwa9rjqvcy4zjgqfzms";
      };
    };

    includes = [
      zen.custom.secrets
    ];
  };
}
