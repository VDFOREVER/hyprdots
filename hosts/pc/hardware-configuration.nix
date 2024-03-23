{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
        { device = "/dev/disk/by-uuid/c5398217-e5ee-4837-adba-16ae92a02eb7";
        fsType = "ext4";
        };

    fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/4642-9AF7";
            fsType = "vfat";
        };

    fileSystems."/mnt/disk" = {
      device = "/dev/disk/by-uuid/97233505-f9b0-4ab6-ad8e-880dc6b1531c";
      fsType = "ext4";
    };

    swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}