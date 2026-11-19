{
  symlinkJoin,
  zaread,
  lib,
}:

symlinkJoin {
  name = "zaread";

  paths = [
    zaread.script
    zaread.desktop
  ];

  meta = {
    description = "Lightweight MS Office file reader via zathura";
    homepage = "https://github.com/paoloap/zaread";
    license = lib.licenses.gpl3;
    mainProgram = "zaread";
  };
}
