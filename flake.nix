{
  inputs = {
    artcraft-nix = {
      type = "github";
      owner = "Devitek";
      repo = "artcraft-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    betterfox = {
      type = "github";
      owner = "yokoffing";
      repo = "betterfox";
      flake = false;
    };

    den = {
      type = "github";
      owner = "denful";
      repo = "den";
    };

    devshells = {
      type = "github";
      owner = "numtide";
      repo = "devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dns-malw-link = {
      type = "github";
      owner = "immalware";
      repo = "dns.malw.link";
      flake = false;
    };

    erosanix = {
      type = "github";
      owner = "emmanuelrosa";
      repo = "erosanix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    files = {
      type = "github";
      owner = "sini";
      repo = "files";
    };

    finix = {
      type = "github";
      owner = "finix-community";
      repo = "finix";
    };

    finix-community = {
      type = "github";
      owner = "finix-community";
      repo = "community-modules";
    };

    flake-file = {
      type = "github";
      owner = "unazikx";
      repo = "flake-file";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    geohide-dns = {
      type = "github";
      owner = "internet-helper";
      repo = "geohidedns";
      flake = false;
    };

    hjem = {
      type = "github";
      owner = "feel-co";
      repo = "hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      type = "github";
      owner = "snugnug";
      repo = "hjem-rum";
      inputs = {
        hjem.follows = "hjem";
        nixpkgs.follows = "nixpkgs";
      };
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hytale-nix = {
      type = "github";
      owner = "andreashgk";
      repo = "hytale-nix";
    };

    import-tree = {
      type = "github";
      owner = "denful";
      repo = "import-tree";
    };

    massgravel = {
      type = "github";
      owner = "massgravel";
      repo = "microsoft-activation-scripts";
      flake = false;
    };

    microvm-nix = {
      type = "github";
      owner = "microvm-nix";
      repo = "microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-math = {
      type = "github";
      owner = "xddxdd";
      repo = "nix-math";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
    };

    nix-obsidian-extensions = {
      type = "github";
      owner = "karaolidis";
      repo = "nix-obsidian-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      type = "github";
      owner = "unnamed-systems";
      repo = "nix-secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wrapper-modules = {
      type = "github";
      owner = "nix-community";
      repo = "nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcraft = {
      type = "github";
      owner = "loystonpais";
      repo = "nixcraft";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixos-cli = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-cli";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.follows = "nixpkgs-unstable";

    nixpkgs-easyeffects = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-25.05";
    };

    nixpkgs-master = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "master";
    };

    nixpkgs-stable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-26.05";
    };

    nixpkgs-unstable = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "nur";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    pkgs-by-name = {
      type = "github";
      owner = "drupol";
      repo = "pkgs-by-name-for-flake-parts";
    };

    proxy-suite-flake = {
      type = "github";
      owner = "fufsob";
      repo = "proxy-suite-flake";
      inputs = {
        disko.follows = "disko";
        nixpkgs.follows = "nixpkgs";
      };
    };

    qutebrowser-adblocks = {
      type = "github";
      owner = "afreakk";
      repo = "greasemonkeyscripts";
      flake = false;
    };

    qutebrowser-hdrezkaplus = {
      type = "github";
      owner = "chebaku";
      repo = "hdrezkaplus";
      ref = "TEST";
      flake = false;
    };

    remove-edge = {
      type = "github";
      owner = "shadowwhisperer";
      repo = "remove-ms-edge";
      flake = false;
    };

    sopsnix = {
      type = "github";
      owner = "mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spectrum = {
      type = "github";
      owner = "unazikx";
      repo = "spectrum";
      flake = false;
    };

    steam-config-nix = {
      type = "github";
      owner = "different-name";
      repo = "steam-config-nix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      type = "github";
      owner = "nix-community";
      repo = "stylix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    tg-ws-proxy-rs = {
      type = "github";
      owner = "gerasti";
      repo = "tg-ws-proxy-pc";
      ref = "nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tinted-schemes = {
      type = "github";
      owner = "tinted-theming";
      repo = "schemes";
      flake = false;
    };

    torrserver = {
      type = "github";
      owner = "yourok";
      repo = "torrserver";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wayswitch = {
      type = "github";
      owner = "wetoshkin";
      repo = "wayswitch";
      flake = false;
    };

    winapps = {
      type = "github";
      owner = "winapps-org";
      repo = "winapps";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
      };
    };

    with-inputs = {
      type = "github";
      owner = "unazikx";
      repo = "with-inputs";
    };

    xmcl = {
      type = "github";
      owner = "x45iq";
      repo = "xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    (inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
      }
      (
        [
          ./configurations
          ./modules
        ]
        |> inputs.import-tree
      )
    );

  nixConfig = {
    accept-flake-config = true;
    extra-experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
    warn-dirty = false;
  };
}
