{
  zen,
  ...
}:

{
  zen.programs.gui._64gram = {
    description = ''
      best messaging

      good ver
    '';

    includes = [
      zen.custom._64gram
      zen.styles.walogram
    ];

    homeManager =
      {
        ...
      }:
      {
        programs._64gram = {
          enable = true;

          settings = {
            # keep-sorted start block=yes
            always_delete_for = 0;
            auto_unmute = false;
            bitrate = 0;
            blocked_user_spoiler_mode = false;
            disable_cloud_draft_sync = false;
            disable_global_search = false;
            disable_link_warning = true;
            disable_premium_animation = false;
            hd_video = false;
            hide_all_chats = false;
            hide_classic_fwd = true;
            hide_counter = false;
            hide_stories = false;
            net_speed_boost = 0;
            repeater_reply_to_orig_msg = false;
            replace_edit_button = true;
            screenshot_mode = false;
            show_emoji_button_as_text = false;
            show_group_sender_avatar = false;
            show_json = false;
            show_messages_id = false;
            show_phone_number = false;
            show_repeater_option = false;
            show_scheduled_button = false;
            show_seconds = false;
            skip_to_next = true;
            stereo_mode = false;
            translate_to_tc = false;
            update_url = "";
            # keep-sorted end
          };

          experiments = {
            # keep-sorted start block=yes
            enable-vulkan-rhi = true;
            unlimited-message-width = true;
            view-profile-in-chats-list-context-menu = true;
            # keep-sorted end
          };

          shortcuts =
            let
              createKey = keys: command: {
                inherit
                  command
                  keys
                  ;
              };
              deleteKey = createKey null;
            in
            [
              # keep-sorted start
              (createKey "alt+," "previous_folder")
              (createKey "alt+." "next_folder")
              (createKey "alt+a" "show_archive")
              (createKey "alt+b" "folder4")
              (createKey "alt+c" "folder2")
              (createKey "alt+d" "self_chat")
              (createKey "alt+f" "media_viewer_video_fullscreen")
              (createKey "alt+g" "first_chat")
              (createKey "alt+j" "next_chat")
              (createKey "alt+k" "previous_chat")
              (createKey "alt+m" "last_folder")
              (createKey "alt+n" "folder5")
              (createKey "alt+q" "close_telegram")
              (createKey "alt+r" "read_chat")
              (createKey "alt+return" "message")
              (createKey "alt+s" "show_contacts")
              (createKey "alt+shift+" "media_previous")
              (createKey "alt+shift+." "media_next")
              (createKey "alt+shift+/" "media_playpause")
              (createKey "alt+shift+1" "account1")
              (createKey "alt+shift+2" "account2")
              (createKey "alt+shift+3" "account3")
              (createKey "alt+shift+4" "account4")
              (createKey "alt+shift+5" "account5")
              (createKey "alt+shift+6" "account6")
              (createKey "alt+shift+a" "archive_chat")
              (createKey "alt+shift+d" "show_chat_menu")
              (createKey "alt+shift+g" "last_chat")
              (createKey "alt+shift+q" "quit_telegram")
              (createKey "alt+shift+return" "message_silently")
              (createKey "alt+shift+s" "show_scheduled")
              (createKey "alt+v" "folder3")
              (createKey "alt+x" "folder1")
              (createKey "alt+z" "all_chats")
              (createKey "ctrl+alt+return" "message_scheduled")
              (deleteKey "alt+down")
              (deleteKey "alt+up")
              (deleteKey "ctrl+0")
              (deleteKey "ctrl+1")
              (deleteKey "ctrl+2")
              (deleteKey "ctrl+3")
              (deleteKey "ctrl+4")
              (deleteKey "ctrl+5")
              (deleteKey "ctrl+6")
              (deleteKey "ctrl+7")
              (deleteKey "ctrl+8")
              (deleteKey "ctrl+9")
              (deleteKey "ctrl+\\")
              (deleteKey "ctrl+alt+end")
              (deleteKey "ctrl+alt+home")
              (deleteKey "ctrl+backtab")
              (deleteKey "ctrl+f")
              (deleteKey "ctrl+f4")
              (deleteKey "ctrl+j")
              (deleteKey "ctrl+l")
              (deleteKey "ctrl+m")
              (deleteKey "ctrl+pgdown")
              (deleteKey "ctrl+pgup")
              (deleteKey "ctrl+q")
              (deleteKey "ctrl+r")
              (deleteKey "ctrl+shift+down")
              (deleteKey "ctrl+shift+tab")
              (deleteKey "ctrl+shift+up")
              (deleteKey "ctrl+tab")
              (deleteKey "ctrl+w")
              (deleteKey "media next")
              (deleteKey "media previous")
              (deleteKey "toggle media play/pause")
              # keep-sorted end
            ];
        };

        xdg.mimeApps = {
          defaultApplications = {
            "x-scheme-handler/tg" = "io.github.tdesktop_x64.TDesktop.desktop";
            "x-scheme-handler/tonsite" = "io.github.tdesktop_x64.TDesktop.desktop";
          };
        };
      };
  };
}
