{
  ...
}:

{
  zen.services.ollama = {
    description = ''
      run AI models locally
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
        services = {
          ollama = {
            enable = true;
            package = pkgs.ollama-rocm;

            loadModels = [
              "deepseek-ocr:latest"
              "mimo-v2.6:latest"
            ];
          };

          ollaya = {
            enable = true;
            package = pkgs.ollama-rocm;

            loadModels = [
              "winnow:e4b"
            ];
          };

          nextjs-ollama-llm-ui.enable = true;
        };
      };
  };
}
