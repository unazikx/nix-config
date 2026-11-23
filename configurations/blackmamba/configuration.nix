{
  zen,
  ...
}:

{
  den.hosts.blackmamba = {
    system = "x86_64-linux";
    class = "nixos";

    isInstaller = false;
    flakeDir = toString /etc/nixos;
    mainUser = "hackerx";

    device = toString /dev/disk/by-id/nvme-RPFTJ256PDD2MWX_SS0R27339Z1CD95Z1273;
    # https://www.impactcomputers.com/hard-drives-ssd/union-memory-rpftj256pdd2mwx

    users.hackerx = {
      classes = [ "homeManager" ];

      shell = "fish";
    };
  };

  zen.hosts.blackmamba = {
    includes = [
      # keep-sorted start block=yes
      zen.hardware.boot.systemd-boot
      zen.services.keyd
      zen.hardware.compression.zswap
      zen.hardware.cpu-gpu
      zen.hardware.mounting
      zen.hardware.networking.dns-malw-link
      zen.hardware.power
      zen.hardware.printing
      zen.hardware.security.yubikey
      zen.miscellaneous.disko
      zen.miscellaneous.home-manager
      zen.miscellaneous.minimal
      zen.miscellaneous.nix
      zen.miscellaneous.nix.substituters
      zen.miscellaneous.nur
      zen.miscellaneous.time
      zen.miscellaneous.version
      zen.programs.cli.nh
      zen.programs.cli.rusted-tools
      zen.secrets.nix-secrets
      zen.services.caddy
      zen.services.greetd
      zen.services.proxy-suite.tg-ws-proxy
      zen.services.proxy-suite.zapret2
      zen.services.qbittorrent
      zen.services.tailscale
      zen.services.tg-ws-proxy-rs
      zen.services.torrserver
      zen.styles.stylix
      zen.suites.hardware
      zen.suites.media
      # keep-sorted end
    ];
  };

  zen.users.hackerx = {
    includes = [
      # keep-sorted start
      zen.games.heronite
      zen.games.hytale
      zen.games.minecraft.prismlauncher
      zen.games.steam
      zen.miscellaneous.bookmarks
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.users.accounts
      zen.miscellaneous.xdg
      zen.programs.cli.appimage
      zen.programs.cli.cava
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.handlr
      zen.programs.cli.monitor
      zen.programs.cli.rbw
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.cli.ytsub
      zen.programs.desktop.umbriel
      zen.programs.editors.helix
      zen.programs.editors.obsidian.personal
      zen.programs.gui._64gram
      zen.programs.gui.easy-effects
      zen.programs.gui.librewolf
      zen.programs.gui.nemo
      zen.programs.gui.obs-studio
      zen.programs.gui.qutebrowser
      zen.programs.gui.spotifast
      zen.programs.gui.throne
      zen.programs.office.artcraft
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
