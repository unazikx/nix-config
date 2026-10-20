{
  zen,
  ...
}:

{
  zen.programs.editors.obsidian.personal = {
    includes = [
      zen.programs.editors.obsidian
    ];

    homeManagerNixos =
      {
        pkgs,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        programs.obsidian.vaults."Personal" = {
          target = "Documents/Personal-Vault";

          settings = {
            app = {
              defaultViewMode = "preview";
              livePreview = false;
              readableLineLength = true;
              showInlineTitle = false;
              showLineNumber = true;
              tabSize = 2;
            };

            appearance = {
              cssTheme = "Minimal";
              enabledCssSnippets = [ "stylix" ];
              showRibbon = false;
              showViewHeader = false;
            };

            themes = [
              pkgs.obsidianThemes.minimal
            ];

            corePlugins = [
              # keep-sorted start block=yes
              {
                name = "backlink";
                settings = {
                  "backlinkInDocument" = true;
                };
              }
              {
                name = "daily-notes";
                settings = {
                  "folder" = "Daily Notes";
                  "format" = "DD-MM-YYYY";
                };
              }
              {
                name = "canvas";
                settings = {
                  "cardLabelVisibility" = "always";
                  "defaultWheelBehavior" = "zoom";
                  "newFileLocation" = "current";
                  "snapToGrid" = true;
                  "snapToObjects" = true;
                };
              }
              {
                name = "graph";
                settings = {
                  "centerStrength" = 0.5;
                  "close" = true;
                  "collapse-color-groups" = true;
                  "collapse-display" = true;
                  "collapse-filter" = true;
                  "collapse-forces" = true;
                  "colorGroups" = [ ];
                  "hideUnresolved" = false;
                  "linkDistance" = 250;
                  "linkStrength" = 1;
                  "repelStrength" = 10;
                  "scale" = 1.5;
                  "showArrow" = false;
                  "showAttachments" = true;
                  "showOrphans" = true;
                  "showTags" = false;
                  "textFadeMultiplier" = 0.5;
                };
              }
              # keep-sorted end

              # keep-sorted start
              "file-explorer"
              "global-search"
              "switcher"
              "outgoing-link"
              "tag-pane"
              "footnotes"
              "properties"
              "page-preview"
              "templates"
              "note-composer"
              "command-palette"
              "slash-command"
              "editor-status"
              "bookmarks"
              "zk-prefixer"
              "random-note"
              "outline"
              "word-count"
              "slides"
              "audio-recorder"
              "workspaces"
              "file-recovery"
              "publish"
              "sync"
              "bases"
              "webviewer"
              # keep-sorted end
            ];

            communityPlugins = [
              # keep-sorted start block=yes
              {
                pkg = pkgs.obsidianPlugins.format-with-prettier;
              }
              {
                pkg = pkgs.obsidianPlugins.helix;
                settings = {
                  "enableHelixKeybindings" = true;
                  "cursorInInsertMode" = "bar";
                };
              }
              {
                pkg = pkgs.obsidianPlugins.obsidian-icon-folder;
                settings = {
                  "settings" = {
                    "emojiStyle" = "native";
                    "fontSize" = 16;
                    "iconColor" = colors.base04;
                    "iconColorInFrontmatterFieldName" = "iconColor";
                    "iconIdentifier" = "=";
                    "iconInFrontmatterEnabled" = false;
                    "iconInFrontmatterFieldName" = "icon";
                    "iconInTabsEnabled" = true;
                    "iconInTitleEnabled" = false;
                    "iconInTitlePosition" = "above";
                    "iconPacksPath" = ".obsidian/icons";
                    "iconsBackgroundCheckEnabled" = false;
                    "iconsInLinksEnabled" = true;
                    "iconsInNotesEnabled" = true;
                    "lucideIconPackType" = "native";
                    "recentlyUsedIconsSize" = 8;
                  };
                };
              }
              {
                pkg = pkgs.obsidianPlugins.obsidian-minimal-settings;
                settings = {
                  "bordersToggle" = true;
                  "chartWidth" = "chart-default-width";
                  "colorfulActiveStates" = true;
                  "colorfulFrame" = false;
                  "colorfulHeadings" = true;
                  "darkScheme" = "minimal-default-dark";
                  "darkStyle" = "minimal-dark";
                  "focusMode" = false;
                  "folding" = true;
                  "fullWidthMedia" = true;
                  "iframeWidth" = "iframe-default-width";
                  "imgGrid" = true;
                  "imgWidth" = "img-default-width";
                  "labeledNav" = true;
                  "lightScheme" = "minimal-default-light";
                  "lightStyle" = "minimal-light";
                  "lineHeight" = 1.5;
                  "lineNumbers" = false;
                  "lineWidth" = 40;
                  "lineWidthWide" = 50;
                  "mapWidth" = "map-default-width";
                  "maxWidth" = 88;
                  "minimalStatus" = true;
                  "readableLineLength" = true;
                  "tableWidth" = "table-default-width";
                  "textSmall" = 13;
                  "trimNames" = true;
                  "underlineExternal" = true;
                  "underlineInternal" = true;
                };
              }
              {
                pkg = pkgs.obsidianPlugins.office-viewer;
              }
              {
                pkg = pkgs.obsidianPlugins.style-manager;
                settings = {
                  "minimal-style@@ax1@@dark" = colors.base0E;
                  "minimal-style@@ax2@@dark" = colors.base0E;
                  "minimal-style@@ax3@@dark" = colors.base0E;
                  "minimal-style@@base@@dark" = colors.base01;
                  "minimal-style@@bg1@@dark" = colors.base00;
                  "minimal-style@@bg2@@dark" = colors.base01;
                  "minimal-style@@bg3@@dark" = colors.base02;
                  "minimal-style@@blockquote-background-color@@dark" = colors.base01;
                  "minimal-style@@blockquote-border-color@@dark" = colors.base08;
                  "minimal-style@@blockquote-border-thickness" = 4;
                  "minimal-style@@blockquote-color@@dark" = colors.base05;
                  "minimal-style@@canvas-dot-pattern@@dark" = colors.base02;
                  "minimal-style@@code-background@@dark" = colors.base01;
                  "minimal-style@@code-comment@@dark" = colors.base03;
                  "minimal-style@@code-function@@dark" = colors.base0D;
                  "minimal-style@@code-important@@dark" = colors.base08;
                  "minimal-style@@code-keyword@@dark" = colors.base0E;
                  "minimal-style@@code-normal@@dark" = colors.base05;
                  "minimal-style@@code-operator@@dark" = colors.base05;
                  "minimal-style@@code-property@@dark" = colors.base05;
                  "minimal-style@@code-punctuation@@dark" = colors.base09;
                  "minimal-style@@code-string@@dark" = colors.base0B;
                  "minimal-style@@code-tag@@dark" = colors.base08;
                  "minimal-style@@code-value@@dark" = colors.base0C;
                  "minimal-style@@color-blue@@dark" = colors.base0D;
                  "minimal-style@@color-cyan@@dark" = colors.base0C;
                  "minimal-style@@color-green@@dark" = colors.base0B;
                  "minimal-style@@color-orange@@dark" = colors.base09;
                  "minimal-style@@color-pink@@dark" = colors.base04;
                  "minimal-style@@color-purple@@dark" = colors.base0E;
                  "minimal-style@@color-red@@dark" = colors.base08;
                  "minimal-style@@color-yellow@@dark" = colors.base09;
                  "minimal-style@@graph-line@@dark" = colors.base03;
                  "minimal-style@@graph-node-attachment@@dark" = colors.base0B;
                  "minimal-style@@graph-node@@dark" = colors.base04;
                  "minimal-style@@graph-node-focused@@dark" = colors.base0E;
                  "minimal-style@@graph-node-tag@@dark" = colors.base09;
                  "minimal-style@@graph-node-unresolved@@dark" = colors.base08;
                  "minimal-style@@hide-help" = true;
                  "minimal-style@@hide-settings" = true;
                  "minimal-style@@icon-color-active@@dark" = colors.base0E;
                  "minimal-style@@icon-color@@dark" = colors.base04;
                  "minimal-style@@icon-color-focused@@dark" = colors.base04;
                  "minimal-style@@icon-color-hover@@dark" = colors.base04;
                  "minimal-style@@sp1@@dark" = colors.base00;
                  "minimal-style@@table-center" = true;
                  "minimal-style@@table-lines" = true;
                  "minimal-style@@table-tabular" = true;
                  "minimal-style@@ui1@@dark" = colors.base02;
                  "minimal-style@@ui2@@dark" = colors.base01;
                  "minimal-style@@ui3@@dark" = colors.base01;
                };
              }
              # keep-sorted end
            ];

            hotkeys = {
              "workspace:close" = [
                {
                  modifiers = [
                    "Mod"
                  ];
                  key = "Q";
                }
              ];
              "workspace:close-window" = [ ];
              "command-palette:open" = [
                {
                  modifiers = [
                    "Mod"
                  ];
                  key = " ";
                }
              ];
              "file-explorer:new-file" = [
                {
                  modifiers = [
                    "Mod"
                  ];
                  key = "A";
                }
              ];
              "file-explorer:new-file-in-new-pane" = [ ];
              "editor:delete-paragraph" = [ ];
              "app:delete-file" = [
                {
                  modifiers = [
                    "Mod"
                    "Shift"
                  ];
                  key = "A";
                }
              ];
              "editor:follow-link" = [ ];
              "workspace:goto-last-tab" = [ ];
              "workspace:goto-tab-1" = [ ];
              "workspace:goto-tab-2" = [ ];
              "workspace:goto-tab-3" = [ ];
              "workspace:goto-tab-4" = [ ];
              "workspace:goto-tab-5" = [ ];
              "workspace:goto-tab-6" = [ ];
              "workspace:goto-tab-7" = [ ];
              "workspace:goto-tab-8" = [ ];
              "obsidian-icon-folder:iconize:set-icon-for-file" = [
                {
                  modifiers = [
                    "Mod"
                  ];
                  key = "I";
                }
              ];
              "editor:insert-link" = [ ];
              "editor:open-link-in-new-leaf" = [ ];
              "editor:open-link-in-new-window" = [ ];
              "editor:open-link-in-new-split" = [ ];
              "app:open-sandbox-vault" = [
                {
                  modifiers = [
                    "Mod"
                  ];
                  key = "'";
                }
              ];
              "editor:toggle-italics" = [ ];
              "editor:toggle-checklist-status" = [ ];
              "editor:toggle-bold" = [ ];
              "editor:toggle-source" = [
                {
                  modifiers = [
                    "Mod"
                    "Shift"
                  ];
                  key = "E";
                }
              ];
            };

            cssSnippets = [
              # keep-sorted start block=yes
              {
                name = "stop-blinking-cursor";
                text = # css
                  ".cm-cursorLayer { animation: none !important; }";
              }
              {
                name = "helix-remove-statusbar";
                text = # css
                  ''
                    .cm-hx-command-panel { display: none !important; }
                    .cm-hx-status-panel  { display: none !important; }
                  '';
              }
              # keep-sorted end
            ];
          };
        };

        stylix.targets = {
          obsidian.vaultNames = [ "Personal" ];
        };
      };
  };
}
