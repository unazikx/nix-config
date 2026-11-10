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
      zen.miscellaneous.time
      zen.miscellaneous.version
      zen.programs.cli.nh
      zen.programs.cli.rusted-tools
      zen.secrets.sopsnix
      zen.services.caddy
      zen.services.greetd
      zen.services.proxy-suite.tg-ws-proxy
      zen.services.proxy-suite.zapret2
      zen.styles.stylix
      zen.suites.hardware
      zen.suites.media
      # keep-sorted end
    ];
  };

  zen.users.hackerx = {
    includes = [
      # keep-sorted start
      zen.games.hytale
      zen.games.minecraft.prismlauncher
      zen.games.steam
      zen.miscellaneous.nix
      zen.miscellaneous.users
      zen.miscellaneous.xdg
      zen.programs.cli.cava
      zen.programs.cli.fastfetch
      zen.programs.cli.gdu
      zen.programs.cli.git
      zen.programs.cli.monitor
      zen.programs.cli.rezka-fzf
      zen.programs.cli.ssh
      zen.programs.cli.yazi
      zen.programs.desktop.umbriel
      zen.programs.editors.helix
      zen.programs.gui._64gram
      zen.programs.gui.easy-effects
      zen.programs.gui.librewolf
      zen.programs.gui.obs-studio
      zen.programs.gui.qutebrowser
      zen.programs.gui.throne
      zen.programs.office.zathura
      zen.programs.terminal.fish
      zen.programs.terminal.trash
      zen.programs.terminal.zoxide
      zen.services.playerctld
      zen.suites.theming
      # keep-sorted end
    ];
  };
}
