{
  python3Packages,
  fetchPypi,
  ani-cli-ru,
  lib,

  withWeb ? false,
}:

python3Packages.buildPythonApplication (_final: {
  pname = "anicli_ru";
  version = "6.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (_final)
      pname
      version
      ;
    hash = "sha256-tlF+j508zVOTxTvSS+7BhVS1ZM+ugqpvSwDOpsYkaUs=";
  };

  build-system = [
    python3Packages.hatchling
  ];

  dependencies = [
    # keep-sorted start
    ani-cli-ru.api
    python3Packages.prompt-toolkit
    python3Packages.rich
    python3Packages.typer
    # keep-sorted end
  ]
  ++ (lib.optionals withWeb [
    ani-cli-ru.uvicorn
    python3Packages.fastapi
    python3Packages.jinja2
    python3Packages.python-multipart
    python3Packages.segno
  ]);

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = {
    description = "Watch anime with ru sources via mpv";
    homepage = "https://github.com/vypivshiy/ani-cli-ru";
    license = lib.licenses.gpl3;
    mainProgram = "anicli-ru";
  };
})
