{
  zen,
  ...
}:

{
  zen.programs.gui.ayugram = {
    description = ''
      best messaging

      modded telegram -> ayugram
      but without spy and save deleted

      i respect deleted messages
      i use it ONLY for bw (black-white) icon tray
    '';

    includes = [
      zen.custom.ayugram-desktop
      zen.styles.walogram
    ];

    homeManager =
      {
        config,
        ...
      }:
      {
        programs.ayugram-desktop = {
          enable = true;

          settings = {
            # keep-sorted start block=yes
            appIcon = "alt";
            channelBottomButton = 0;
            collapseSimilarChannels = true;
            deletedMark = "deleted";
            disableAds = true;
            disableCustomBackgrounds = false;
            disableNotificationsDelay = false;
            disableStories = false;
            editedMark = "edited";
            gifConfirmation = false;
            hideAllChatsFolder = true;
            hideChannelReactions = true;
            hideFromBlocked = false;
            hideGroupReactions = true;
            hideNotificationBadge = false;
            hideNotificationCounters = false;
            hideSimilarChannels = false;
            increaseWebviewHeight = false;
            increaseWebviewWidth = false;
            localPremium = false;
            markReadAfterAction = false;
            monoFont = config.stylix.fonts.monospace.name;
            recentStickersCount = 100;
            replaceBottomInfoWithIcons = true;
            saveDeletedMessages = false;
            saveForBots = false;
            saveMessagesHistory = false;
            sendOfflinePacketAfterOnline = false;
            sendOnlinePackets = true;
            sendReadMessages = true;
            sendReadStories = true;
            sendUploadProgress = true;
            sendWithoutSound = false;
            showAttachButtonInMessageField = true;
            showAttachPopup = true;
            showAutoDeleteButtonInMessageField = true;
            showCommandsButtonInMessageField = true;
            showEmojiButtonInMessageField = true;
            showEmojiPopup = true;
            showGhostToggleInDrawer = true;
            showGhostToggleInTray = true;
            showHideMessageInContextMenu = 2;
            showLReadToggleInDrawer = true;
            showMessageDetailsInContextMenu = 2;
            showMessageSeconds = false;
            showMessageShot = true;
            showMicrophoneButtonInMessageField = true;
            showOnlyAddedEmojisAndStickers = false;
            showPeerId = 2;
            showReactionsPanelInContextMenu = 1;
            showSReadToggleInDrawer = true;
            showStreamerToggleInDrawer = false;
            showStreamerToggleInTray = false;
            showUserMessagesInContextMenu = 2;
            showViewsPanelInContextMenu = 1;
            simpleQuotesAndReplies = false;
            spoofWebviewAsAndroid = false;
            stickerConfirmation = false;
            useScheduledMessages = false;
            voiceConfirmation = false;
            wideMultiplier = 1.6;
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
            "x-scheme-handler/tg" = "com.ayugram.desktop.desktop";
            "x-scheme-handler/tonsite" = "com.ayugram.desktop.desktop";
          };
        };
      };
  };
}
