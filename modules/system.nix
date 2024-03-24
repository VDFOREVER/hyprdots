{ lib, pkgs, ... }: let username = "vdforever";
in {

    nix.settings = {
        # enable flakes globally
        experimental-features = ["nix-command" "flakes"];
        trusted-users = [username];
        substituters = [
            "https://cache.nixos.org"
        ];

        trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
        builders-use-substitutes = true;
    };

    zramSwap = {
        enable = true;
        algorithm = "zstd";
    };

    nixpkgs.config.allowUnfree = true;

    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    # Set your time zone.
    time.timeZone = "Europe/Moscow";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    # Enable sound.
    sound.enable = true;
    services = {
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
            wireplumber.enable = true;
        };
        earlyoom.enable = true;
    };

    users.users.vdforever = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };

    programs.fish.enable = true;

    environment.systemPackages = with pkgs; [
        neofetch
        htop
        earlyoom
        git
    ];

    fonts.packages = with pkgs; [
        jetbrains-mono
        nerdfonts
        noto-fonts-color-emoji
    ];
}