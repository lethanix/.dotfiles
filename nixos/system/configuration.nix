{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # **********************************************************************
  # Kernel & Bootloader
  # **********************************************************************

  boot.loader.timeout = 3;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 4;

  boot.initrd.luks.devices."luks-6debef84-20e2-45b6-ba71-812a1306739f".device = "/dev/disk/by-uuid/6debef84-20e2-45b6-ba71-812a1306739f";

  # **********************************************************************
  # Enable flakes

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # **********************************************************************

  networking.hostName = "nixos-btw"; # Define your hostname.
  networking.networkmanager.enable = true;

  # **********************************************************************

  services.displayManager.ly.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Fix time sync problem with dual boot Windows
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
  
  # Configure power management
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
       
       START_CHARGE_THRESH_BAT1=40;
       STOP_CHARGE_THRESH_BAT1=80;
      };
  };
  
  # **********************************************************************

  users.users.lethanix = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # **********************************************************************
  # Packages
  # **********************************************************************
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    vim 
    git
    kitty
    wireplumber
  ];

  fonts.packages = with pkgs; [
  	nerd-fonts.jetbrains-mono 
  ];

  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };

  programs.firefox.enable = true;
  
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # **********************************************************************
  # Graphics
  # **********************************************************************
  # services.xserver.videoDrivers = [ "nouveau" ];
  hardware.nvidia.open = false;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [ libva-vdpau-driver ];

  # More options:
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

  # nvidia-drm.modeset=1 is required for some wayland compositors
  hardware.nvidia.modesetting.enable = true;

  # **********************************************************************

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
