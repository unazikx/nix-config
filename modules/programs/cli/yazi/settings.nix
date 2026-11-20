{
  zen,
  ...
}:

{
  zen.programs.cli.yazi.settings = {
    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      {
        programs.yazi = {
          settings = {
            mgr = {
              ratio = [
                1
                3
                4
              ];
              show_hidden = false;
              sort_by = "natural";
              sort_dir_first = true;
              sort_reverse = false;
              linemode = "size";
              show_symlink = true;
            };

            preview = {
              wrap = "yes";
              tab_size = 1;
              image_filter = "lanczos3";
              image_quality = 90;
              max_height = 5000;
              max_width = 5000;
            };

            input = lib.genAttrs [
              "cd_origin"
              "find_origin"
              "rename_origin"
              "filter_origin"
              "create_origin"
              "delete_origin"
              "search_origin"
              "shell_origin"
            ] (_: "center");

            plugin = {
              prepend_previewers =
                [
                  (lib.yazi.mkPluginMime "office" [
                    "application/ms-*"
                    "application/msword"
                    "application/oasis.*"
                    "application/openxmlformats-officedocument.*"
                  ])
                  (lib.yazi.mkPluginMime "ouch --archive-icon=''" [
                    "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}"
                  ])
                  (lib.yazi.mkPluginUrl ''faster-piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dracula -- "$1"'' [
                    "*.md"
                  ])
                  (lib.yazi.mkPluginUrl "comicthumb" [
                    "*.cb[7rz]"
                  ])
                  (lib.yazi.mkPluginMime "djvu-view" [
                    "image/djvu"
                  ])
                ]
                |> lib.mkMerge;

              prepend_fetchers = [
                {
                  group = "git";
                  url = "*";
                  run = "git";
                }
                {
                  group = "git";
                  url = "*/";
                  run = "git";
                }
              ];
            };

            opener = {
              msoffice-pdf = lib.mkIf (user.hasAspect zen.programs.office.zathura) [
                {
                  run = "zaread %s";
                  desc = "Open document in Zathura";
                  orphan = true;
                }
              ];

              extract-archive = [
                {
                  run = "ouch d -y %s";
                  desc = "Extract files via ouch";
                }
              ];
            };

            open = {
              rules = [
                {
                  mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
                  use = [
                    "extract-archive"
                  ];
                }
                {
                  mime = "text/*";
                  use = [
                    "edit"
                  ];
                }
                {
                  mime = "application/{epub+zip,json,ndjson,javascript,wine-extension-ini}";
                  use = "edit";
                }
                {
                  mime = "inode/empty";
                  use = "edit";
                }
                {
                  url = "*";
                  use = [
                    "open"
                    "edit"
                  ];
                }
              ];
            };

            tasks.image_bound = [
              0
              0
            ];
          };

          plugins =
            let
              mkPlugin = name: content: {
                "${name}" = "${pkgs.writeTextDir "${name}.yazi/main.lua" content}/${name}.yazi";
              };
            in
            [
              {
                inherit (pkgs.yaziPlugins)
                  chmod
                  full-border
                  git
                  jump-to-char
                  mount
                  ouch
                  restore
                  smart-enter
                  smart-paste
                  toggle-pane
                  ;

                inherit (self'.legacyPackages.yazi-plugins)
                  cba-preview
                  convert
                  djvu-preview
                  office
                  piper
                  torrent-preview
                  yatline
                  ;
              }

              (mkPlugin "parent-arrow" # lua
                ''
                  --- @sync entry
                  local function entry(_, job)
                  local parent = cx.active.parent if not parent then return end
                  local offset = tonumber(job.args[1]) if not offset then return
                  ya.err(job.args[1], 'is not a number') end
                  local start = parent.cursor + 1 + offset
                  local end_ = offset < 0 and 1 or #parent.files
                  local step = offset < 0 and -1 or 1
                  for i = start, end_, step do local target = parent.files[i]
                  if target and target.cha.is_dir then return
                  ya.mgr_emit("cd", { target.url }) end end end
                  return { entry = entry }
                ''
              )

              (mkPlugin "smart-tab" # lua
                ''
                  --- @sync entry
                  return {
                    entry = function() local h = cx.active.current.hovered
                    ya.emit("tab_create", h and h.cha.is_dir and
                    { h.url } or { current = true }) end,
                  }
                ''
              )
            ]
            |> lib.mkMerge;

          initLua =
            let
              colors = config.lib.stylix.colors.withHashtag;
            in
            ''
              require("full-border"):setup { set = ui.Border.ROUNDED, }

              require("git"):setup()
              th.git = th.git or {}
              th.git.modified  = ui.Style():fg("yellow"):bold()
              th.git.added     = ui.Style():fg("green"):bold()
              th.git.untracked = ui.Style():fg("gray"):bold()
              th.git.ignored   = ui.Style():fg("white"):bold()
              th.git.deleted   = ui.Style():fg("red"):bold()
              th.git.updated   = ui.Style():fg("yellow"):bold()

              require("yatline"):setup({
                section_separator = { open = "", close = "" },
                inverse_separator = { open = "", close = "" },
                part_separator    = { open = "", close = "" },

                style_a = {
                  fg = "${colors.base00}",
                  bg_mode = {
                    normal = "${colors.base0C}",
                    select = "${colors.base0A}",
                    un_set = "${colors.base09}"
                  }
                },
                style_b = {
                  bg = "${colors.base03}",
                  fg = "${colors.base05}"
                },
                style_c = {
                  bg = "${colors.base00}",
                  fg = "${colors.base05}"
                },

                permissions_t_fg = "green",
                permissions_r_fg = "yellow",
                permissions_w_fg = "red",
                permissions_x_fg = "cyan",
                permissions_s_fg = "darkgray",

                show_background     = false,
                display_header_line = true,
                display_status_line = true,
                tab_width           = 20,
                tab_use_inverse     = false,

                selected = { icon = "󰻭", fg = "yellow" },
                copied   = { icon = "", fg = "green" },
                cut      = { icon = "", fg = "red" },

                total     = { icon = "󰮍", fg = "yellow" },
                succ      = { icon = "", fg = "green" },
                fail      = { icon = "", fg = "red" },
                found     = { icon = "󰮕", fg = "blue" },
                processed = { icon = "󰐍", fg = "green" },

                header_line = {
                  left = {
                    section_a = { { type = "string", custom = false, name = "tab_path", params = {{ trimed = true, max_length = 24, trim_length = 10 }} }, },
                    section_b = { },
                    section_c = { }
                  },
                  right = {
                    section_a = { { type = "line", custom = false, name = "tabs", params = { "right" } }, },
                    section_b = { },
                    section_c = { }
                  }
                },

                status_line = {
                  left = {
                    section_a = { { type = "string",   custom = false, name = "tab_mode" }, },
                    section_b = { { type = "string",   custom = false, name = "cursor_position" }, },
                    section_c = { { type = "coloreds", custom = false, name = "count" }, }
                  },
                  right = {
                    section_a = { { type = "string",   custom = false, name = "hovered_mime" },
                                  { type = "string",   custom = false, name = "hovered_file_extension" }, },
                    section_b = { { type = "string",   custom = false, name = "hovered_size" }, },
                    section_c = { { type = "coloreds", custom = false, name = "permissions" }, }
                  }
                },
              })

              require("restore"):setup({ show_confirm = true, })
            '';
        };
      };
  };
}
