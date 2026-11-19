{
  makeDesktopItem,
}:

makeDesktopItem {
  name = "zaread";
  desktopName = "zaread";

  comment = "Lightweight MS Office file reader via zathura";

  exec = "zaread %U";
  icon = "org.pwmt.zathura";

  terminal = false;
  noDisplay = true;

  categories = [
    "Office"
    "Viewer"
  ];

  mimeTypes = [
    "application/pdf"
    "application/epub+zip"
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    "application/msword"
    "application/vnd.ms-excel"
    "application/vnd.ms-powerpoint"
    "application/vnd.oasis.opendocument.text"
    "application/vnd.oasis.opendocument.spreadsheet"
    "application/vnd.oasis.opendocument.presentation"
    "application/vnd.ms-excel.sheet.macroEnabled.12"
    "application/vnd.ms-excel.sheet.binary.macroEnabled.12"
    "application/vnd.ms-word.document.macroEnabled.12"
    "application/vnd.ms-powerpoint.presentation.macroEnabled.12"
    "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
    "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
    "text/rtf"
    "text/csv"
    "application/x-mobipocket-ebook"
    "text/markdown"
  ];
}
