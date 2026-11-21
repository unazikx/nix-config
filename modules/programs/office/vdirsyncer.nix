{
  ...
}:

{
  zen.programs.office.vdirsyncer = {
    homeManager =
      {
        ...
      }:
      {
        programs.vdirsyncer.enable = true;
        services.vdirsyncer.enable = true;
      };
  };
}
