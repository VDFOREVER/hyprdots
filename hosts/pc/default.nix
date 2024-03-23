{ config, pkgs, ... }:

{
    imports =
    [
      ../../modules/system.nix

      ./hardware-configuration.nix
    ];

    # Bootloader.
    boot.loader = {
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
        };
        efi.canTouchEfiVariables = true;
    };

    programs.nix-ld.enable = true;

    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };

    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-qt;
        enableSSHSupport = true;
    };

    system.stateVersion = "24.05";
}