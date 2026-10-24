{
  zen,
  ...
}:

{
  den.hosts.jetpure = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = false;
    flakeDir = toString /etc/nixos;
    mainUser = "nixzoid";

    device = toString /dev/disk/by-id/ata-KINGSTON_SA400S37240G_50026B72828C9A2D;
    # https://www.kingston.com/en/ssd/a400-solid-state-drive

    age = "age1yubikey1qv7v8nxwrz4f8aagxu8yxq4fe9ltw8dx0eahycynufvqefznvy5u7v57hvy";

    users.nixzoid = {
      classes = [ "homeManager" ];

      shell = "fish";

      age = "age1yubikey1q2c9snmkv7snv8tmgsvwc2rlgr92tvv0grqfxu7dw9g7jj9khms4yusej9e";
    };
  };

  zen.hosts.jetpure = {
    includes = [
      # keep-sorted start block=yes
      zen.games.xbox.driver
      zen.hardware.boot.systemd-boot
      zen.hardware.compression.zram
      zen.hardware.cpu-gpu
      zen.hardware.mounting
      zen.hardware.networking.geohide-dns
      zen.hardware.security.yubikey
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.lon
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.substituters
      zen.miscellaneous.nur
      zen.miscellaneous.time
      zen.miscellaneous.users.accounts
      zen.miscellaneous.version
      zen.programs.cli.nixos-cli
      zen.programs.cli.rusted-tools
      zen.secrets.sopsnix
      zen.services.caddy
      zen.services.greetd
      zen.services.proxy-suite.tg-ws-proxy
      zen.services.proxy-suite.zapret2
      zen.services.qbittorrent
      zen.services.tailscale
      zen.services.vaultwarden
      zen.styles.stylix
      zen.suites.hardware
      zen.suites.media
      # keep-sorted end
    ];
  };

  zen.users.nixzoid = {
    includes = [
      # keep-sorted start
      zen.games.gale
      zen.games.heroic
      zen.games.hytale
      zen.games.minecraft.prismlauncher
      zen.games.minecraft.xmcl
      zen.games.srb2
      zen.games.steam
      zen.games.steam-tui
      zen.games.supertuxkart
      zen.games.umu-launcher
      zen.miscellaneous.canvas-commons
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.monitor
      zen.programs.cli.rbw
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.desktop.umbriel
      zen.programs.editors.helix
      zen.programs.editors.obsidian.personal
      zen.programs.gui._64gram
      zen.programs.gui.easy-effects
      zen.programs.gui.librewolf
      zen.programs.gui.obs-studio
      zen.programs.gui.qutebrowser
      zen.programs.gui.spotifast
      zen.programs.gui.throne
      zen.programs.gui.vesktop
      zen.programs.office.artcraft
      zen.programs.office.blender
      zen.programs.office.libreoffice
      zen.programs.office.zathura
      zen.programs.terminal.fish
      zen.programs.terminal.translate-shell
      zen.programs.terminal.trash
      zen.programs.terminal.zoxide
      zen.services.playerctld
      zen.suites.theming
      # keep-sorted end
    ];
  };
}
