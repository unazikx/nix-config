{
  ...
}:

{
  zen.programs.cli.rclone = {
    description = ''
      remote files and drives downloader
      and syncer
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.rclone = {
          enable = true;
        };
      };
  };
}
