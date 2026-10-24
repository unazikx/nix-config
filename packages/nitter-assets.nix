{
  stdenv,
  writeText,
  nitter,
  colors ? {
    base00 = "#151515";
    base01 = "#1f1f1f";
    base02 = "#2e2e2e";
    base03 = "#424242";
    base04 = "#bbb6b6";
    base05 = "#e8e3e3";
    base06 = "#e8e3e3";
    base07 = "#e8e3e3";
    base08 = "#b66467";
    base09 = "#d9bc8c";
    base0A = "#d9bc8c";
    base0B = "#8c977d";
    base0C = "#8aa6a2";
    base0D = "#8da3b9";
    base0E = "#a988b0";
    base0F = "#bbb6b6";
    base10 = "#151515";
    base11 = "#151515";
    base12 = "#b66467";
    base13 = "#d9bc8c";
    base14 = "#8c977d";
    base15 = "#8aa6a2";
    base16 = "#8da3b9";
  },
}:

let
  stylix-theme = writeText "stylix.css" ''
    body {
      --bg_color: ${colors.base00};
      --fg_color: ${colors.base05};
      --fg_faded: ${colors.base0C};
      --fg_dark: var(--fg_faded);
      --fg_nav: var(--accent);

      --bg_panel: ${colors.base02};
      --bg_elements: ${colors.base01};
      --bg_overlays: ${colors.base02};
      --bg_hover: ${colors.base03};

      --grey: var(--fg_faded);
      --dark_grey: ${colors.base03};
      --darker_grey: ${colors.base02};
      --darkest_grey: ${colors.base01};
      --border_grey: ${colors.base01};

      --accent: ${colors.base0C};
      --accent_light: ${colors.base0D};
      --accent_dark: var(--accent);
      --accent_border: ${colors.base0D};

      --play_button: ${colors.base09};
      --play_button_hover: ${colors.base0A};

      --more_replies_dots: ${colors.base0E};
      --error_red: ${colors.base08};

      --verified_blue: var(--accent);
      --icon_text: ${colors.base05};

      --tab: ${colors.base03};
      --tab_selected: ${colors.base04};

      --profile_stat: ${colors.base05};
    }

    .search-bar > form input::placeholder{
      color: var(--fg_faded);
    }
  '';
in

stdenv.mkDerivation (_final: {
  pname = "nitter-assets";
  version = nitter.version;

  src = nitter.src;

  installPhase = ''
    mkdir $out

    cp -r public/* $out

    cp -r ${stylix-theme} $out/css/themes/stylix.css
  '';

  allowSubstitutes = false;
  preferLocalBuild = true;

  meta = nitter.meta // {
    description = "Nitter with custom base16 theme.";
  };
})
