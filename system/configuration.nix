# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # **********************************************************************
  # Kernel & Bootloader
  # **********************************************************************

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.timeout = 1;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 4;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # **********************************************************************
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # **********************************************************************

  networking.hostName = "nixy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.wireless.userControlled.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # **********************************************************************

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Fix time sync problem with dual boot Windows
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # **********************************************************************

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lethanix = {
    isNormalUser = true;
    home = "/home/lethanix";
    extraGroups = [ "networkmanager" "wheel" ]; # Enable 'sudo' for the user
  };

  # **********************************************************************
  # Packages
  # **********************************************************************
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    kitty
    firefox
    catppuccin-gtk # gtk theme. Other: dracula-theme 
    catppuccin-cursors # gnome3.adwaita-icon-theme default gnome cursors
  ];

  # List services that you want to enable:
  sound.enable = true;

  # **********************************************************************
  # Graphics
  # **********************************************************************
  # services.xserver.videoDrivers = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ vaapiVdpau ];

  # More options:
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  # nvidia-drm.modeset=1 is required for some wayland compositors
  hardware.nvidia.modesetting.enable = true;

  # **********************************************************************
  # Wayland 
  # **********************************************************************
  # NOTE: Using flake.nix for Hyprland 

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "lethanix";

  # NOTE: Start without a login display manager
  programs.bash.loginShellInit = ''
    	if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          	exec Hyprland
          fi
  '';

  programs.xwayland.enable = true;

  # Enabling PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };


  # **********************************************************************
  # Bluetooth
  # **********************************************************************
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.package = pkgs.bluez;
  hardware.bluetooth.settings = {
    General = {
      MultiProfile = "multiple";
    };
  };


  # **********************************************************************
  # NixOS release
  # **********************************************************************
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  system.autoUpgrade.enable = true;
}
