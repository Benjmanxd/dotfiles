{ config, lib, options, pkgs, ... }:
{
  imports = [
    ./modules/nordvpn.nix
  ];
  # bootloader
  boot = {
    kernelParams = [ "quiet" ];
    extraModulePackages = [ config.hardware.nvidia.package ];

    initrd = {
      systemd.enable = true;
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ "kvm-amd" "snd-seq" "snd-rawmidi" ];
    };

    loader = {
      # systemd-boot.enable = true;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_6.override {
      argsOverride = rec {
        src = pkgs.fetchurl {
          url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
          # generated with nix-hash --flat --base32 --type sha256 {filename}
          sha256 = "e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336";
        };
        version = "6.6.62";
        modDirVersion = "6.6.62";
      };
    });
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.settings.auto-optimise-store = true;

  users.users.benjmanxd = {
    isNormalUser = true;
    extraGroups = [
      "qemu-libvirtd"
      "libvirtd"
      "wheel"
      "video"
      "audio"
      "jackaudio"
      "networkmanager"
      "nordvpn"
    ]; # Enable ‘sudo’ for the user.
    group = "users";
    packages = [];
  };

  time.timeZone = "Asia/Hong_Kong";

  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    libreoffice
    git
    xfce.thunar
    zsh
    zathura
    home-manager
    lightdm-gtk-greeter
    dconf
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nordvpn"
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
  ];

  environment.variables.EDITOR = "vim";

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    desktopManager.runXdgAutostartIfNone = true;
    windowManager.openbox.enable = true;
    # videoDrivers = [ "nvidia" ];
    displayManager = {
      lightdm = {
        enable = true;
        greeters.gtk = {
          enable = true;
        };
      };
    };
  };
  services.displayManager.defaultSession = "none+openbox";

  security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   jack.enable = true;
  # };
  services.jack = {
    jackd.enable = true;
    alsa.enable = false;
    loopback = {
      enable = true;
    };
  };

  services.pulseaudio.package = pkgs.pulseaudio.override { jackaudioSupport = true; };

  services.pcscd.enable = true;

  programs.dconf.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
    enableSSHSupport = true;
  };

  networking.useDHCP = lib.mkDefault true;
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;
  services.bind.enable = true;

  virtualisation.libvirtd.enable = true;

  system.stateVersion = "25.11";

  # custom services
  benjmanxd.services.custom.nordvpn.enable = true;

  # systemd.services."systemd-suspend" = {
  #   serviceConfig = {
  #     Environment=''"SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=false"'';
  #   };
  # };
}
