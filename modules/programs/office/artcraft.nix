{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    artcraft-nix = {
      type = "github";
      owner = "Devitek";
      repo = "artcraft-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.office.artcraft = {
    description = ''
      open-source alternatives for Abobe/MS Office/other
    '';

    homeManagerNixos =
      {
        inputs',
        lib,
        ...
      }:
      {
        home.packages =
          {
            # Adobe Suite
            "Photoshop" = inputs'.artcraft-nix.packages.photocraft;
            "Lightroom" = inputs'.artcraft-nix.packages.lightcraft;
            "AfterEffects" = inputs'.artcraft-nix.packages.effectcraft;
            "PremierePro" = inputs'.artcraft-nix.packages.filmcraft;
            "Illustrator" = inputs'.artcraft-nix.packages.vectorcraft;

            # Microsoft Office
            "Word" = inputs'.artcraft-nix.packages.wordcraft;
            "PowerPoint" = inputs'.artcraft-nix.packages.deckcraft;
            "Excel" = inputs'.artcraft-nix.packages.gridcraft;
            "PDF" = inputs'.artcraft-nix.packages.pdfcraft;

            # other
            "CAD" = inputs'.artcraft-nix.packages.cadcraft;
            "Audacity" = inputs'.artcraft-nix.packages.soundcraft;
          }
          |> lib.attrValues;

        xdg.mimeApps.defaultApplications = lib.mkMerge [
          {
            # wordcraft
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
              "ai.storyteller.wordcraft.desktop";
            "application/vnd.openxmlformats-officedocument.wordprocessingml.template" =
              "ai.storyteller.wordcraft.desktop";
            "application/vnd.ms-word.document.macroEnabled.12" = "ai.storyteller.wordcraft.desktop";
            "application/vnd.ms-word.template.macroEnabled.12" = "ai.storyteller.wordcraft.desktop";
            "application/msword" = "ai.storyteller.wordcraft.desktop";
            "application/msword-template" = "ai.storyteller.wordcraft.desktop";
            "application/vnd.oasis.opendocument.text" = "ai.storyteller.wordcraft.desktop";
            "application/rtf" = "ai.storyteller.wordcraft.desktop";
            "text/rtf" = "ai.storyteller.wordcraft.desktop";
          }
          {
            # gridcraft
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
              "ai.storyteller.gridcraft.desktop";
            "application/vnd.ms-excel.sheet.macroEnabled.12" = "ai.storyteller.gridcraft.desktop";
            "application/vnd.ms-excel.sheet.binary.macroEnabled.12" = "ai.storyteller.gridcraft.desktop";
            "application/vnd.oasis.opendocument.spreadsheet" = "ai.storyteller.gridcraft.desktop";
            "text/csv" = "ai.storyteller.gridcraft.desktop";
            "text/tab-separated-values" = "ai.storyteller.gridcraft.desktop";
          }
          {
            # deckcraft
            "application/x-deckcraft" = "ai.storyteller.deckcraft.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
              "ai.storyteller.deckcraft.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.template" =
              "ai.storyteller.deckcraft.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.slideshow" =
              "ai.storyteller.deckcraft.desktop";
          }
          {
            # pdfcraft
            "application/pdf" = "ai.storyteller.pdfcraft.desktop";
            "application/x-pdf" = "ai.storyteller.pdfcraft.desktop";
          }
          {
            # photocraft
            "application/x-photocraft" = "ai.storyteller.photocraft.desktop";
            "image/vnd.adobe.photoshop" = "ai.storyteller.photocraft.desktop";
            "image/x-psd" = "ai.storyteller.photocraft.desktop";
            "image/x-psb" = "ai.storyteller.photocraft.desktop";
            "image/openraster" = "ai.storyteller.photocraft.desktop";
            "application/x-krita" = "ai.storyteller.photocraft.desktop";
            "image/x-paintnet" = "ai.storyteller.photocraft.desktop";
            "image/png" = "ai.storyteller.photocraft.desktop";
            "image/jpeg" = "ai.storyteller.photocraft.desktop";
            "image/tiff" = "ai.storyteller.photocraft.desktop";
            "image/webp" = "ai.storyteller.photocraft.desktop";
            "image/gif" = "ai.storyteller.photocraft.desktop";
            "image/bmp" = "ai.storyteller.photocraft.desktop";
            "image/x-tga" = "ai.storyteller.photocraft.desktop";
            "image/x-icon" = "ai.storyteller.photocraft.desktop";
            "image/vnd.microsoft.icon" = "ai.storyteller.photocraft.desktop";
            "image/x-portable-anymap" = "ai.storyteller.photocraft.desktop";
            "image/x-portable-bitmap" = "ai.storyteller.photocraft.desktop";
            "image/x-portable-graymap" = "ai.storyteller.photocraft.desktop";
            "image/x-portable-pixmap" = "ai.storyteller.photocraft.desktop";
            "image/x-exr" = "ai.storyteller.photocraft.desktop";
            "image/vnd.radiance" = "ai.storyteller.photocraft.desktop";
            "image/avif" = "ai.storyteller.photocraft.desktop";
            "image/qoi" = "ai.storyteller.photocraft.desktop";
          }
          {
            # vectorcraft
            "application/x-vectorcraft" = "ai.storyteller.vectorcraft.desktop";
            "application/x-vectorcraft-template" = "ai.storyteller.vectorcraft.desktop";
            "image/svg+xml" = "ai.storyteller.vectorcraft.desktop";
            "image/svg+xml-compressed" = "ai.storyteller.vectorcraft.desktop";
            "application/illustrator" = "ai.storyteller.vectorcraft.desktop";
            "application/x-ai-template" = "ai.storyteller.vectorcraft.desktop";
            "application/x-affinity" = "ai.storyteller.vectorcraft.desktop";
            "image/x-eps" = "ai.storyteller.vectorcraft.desktop";
            "image/emf" = "ai.storyteller.vectorcraft.desktop";
            "image/wmf" = "ai.storyteller.vectorcraft.desktop";
          }
          {
            # designcraft
            "application/x-designcraft" = "ai.storyteller.designcraft.desktop";
            "application/vnd.adobe.indesign-idml-package" = "ai.storyteller.designcraft.desktop";
          }
          {
            # lightcraft
            "image/heic" = "ai.storyteller.lightcraft.desktop";
            "image/heif" = "ai.storyteller.lightcraft.desktop";
            "image/x-adobe-dng" = "ai.storyteller.lightcraft.desktop";
            "image/x-sony-arw" = "ai.storyteller.lightcraft.desktop";
            "image/x-canon-cr2" = "ai.storyteller.lightcraft.desktop";
            "image/x-canon-cr3" = "ai.storyteller.lightcraft.desktop";
            "image/x-nikon-nef" = "ai.storyteller.lightcraft.desktop";
            "image/x-fuji-raf" = "ai.storyteller.lightcraft.desktop";
            "image/x-olympus-orf" = "ai.storyteller.lightcraft.desktop";
            "image/x-panasonic-rw2" = "ai.storyteller.lightcraft.desktop";
            "image/x-panasonic-rw" = "ai.storyteller.lightcraft.desktop";
            "image/x-pentax-pef" = "ai.storyteller.lightcraft.desktop";
          }
          {
            # filmcraft
            "application/x-filmcraft" = "ai.storyteller.filmcraft.desktop";
            "video/mp4" = "ai.storyteller.filmcraft.desktop";
            "video/x-m4v" = "ai.storyteller.filmcraft.desktop";
            "video/quicktime" = "ai.storyteller.filmcraft.desktop";
            "video/x-matroska" = "ai.storyteller.filmcraft.desktop";
            "video/webm" = "ai.storyteller.filmcraft.desktop";
            "video/vnd.avi" = "ai.storyteller.filmcraft.desktop";
            "video/x-msvideo" = "ai.storyteller.filmcraft.desktop";
            "application/mxf" = "ai.storyteller.filmcraft.desktop";
            "video/mp2t" = "ai.storyteller.filmcraft.desktop";
            "video/mpeg" = "ai.storyteller.filmcraft.desktop";
            "video/3gpp" = "ai.storyteller.filmcraft.desktop";
          }
          {
            # soundcraft
            "application/x-soundcraft-session" = "ai.storyteller.soundcraft.desktop";
            "audio/x-wav" = "ai.storyteller.soundcraft.desktop";
            "audio/wav" = "ai.storyteller.soundcraft.desktop";
            "audio/vnd.wave" = "ai.storyteller.soundcraft.desktop";
            "audio/x-aiff" = "ai.storyteller.soundcraft.desktop";
            "audio/aiff" = "ai.storyteller.soundcraft.desktop";
            "audio/flac" = "ai.storyteller.soundcraft.desktop";
            "audio/x-flac" = "ai.storyteller.soundcraft.desktop";
            "audio/mpeg" = "ai.storyteller.soundcraft.desktop";
            "audio/midi" = "ai.storyteller.soundcraft.desktop";
            "audio/x-midi" = "ai.storyteller.soundcraft.desktop";
          }
          {
            # cadcraft
            "image/vnd.dxf" = "ai.storyteller.cadcraft.desktop";
            "image/vnd.dwg" = "ai.storyteller.cadcraft.desktop";
            "application/x-dxf" = "ai.storyteller.cadcraft.desktop";
            "application/acad" = "ai.storyteller.cadcraft.desktop";
          }
        ];
      };
  };
}
