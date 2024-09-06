{ pkgs, ... }:
{ 
    imports =
        [ 
            ./hardware-configuration.nix
            # ./packages/systemPackages.nix
            # ./packages/nix-ld.nix
            # ./packages/extra.nix
            # ./packages/nh.nix
            # ./packages/opentabletdriver.nix
            # ./packages/nvidia.nix
            # ./packages/fzf.nix
            # # ./nouveau.nix
            # # ./emacs.nix
            # # ./awesome.nix
            ./packages
        ];

    programs.zsh={
        enable = true;
        enableCompletion = false;  
        enableLsColors = false;
        autosuggestions.async = false;
    };


    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout=0;

    environment.variables={
        EDITOR = "nvim";
        VISUAL = "nvim";
        # ZDOTDIR="$HOME/.config/zsh/";
        FUNCNEST = 1000;
    };

    environment.pathsToLink = [ "/share/zsh" ];

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Iosevka" ]; })
        noto-fonts #universal_fonts
    ];

    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    services.blueman.enable = true;

    networking={
        hostName = "nixos";
        networkmanager.enable = true;
    };  

    #Set your time zone. 
    time.timeZone = "Asia/Kathmandu";

    # Enable sound.
    security.rtkit.enable = true;

    services={
        pipewire={
            enable = true;
            alsa.enable = true;
            alsa.support32Bit=true;
            pulse.enable = true;
        };
    };

    services.journald.extraConfig = "SystemMaxUse=1G";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    services.sshd.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config={
        allowUnfree = true; 
        allowBroken = true;

    };

    # nixpkgs.config = {
    #     segger-jlink.acceptLicense = true;
    #     allowInsecurePredicate = pkg: builtins.stringLength (lib.getName pkg) <= 30;
    #     allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #         "segger-jlink"
    #         "nrf-command-line-tools"
    #     ];
    # };
    #
    # services.udev.extraRules = builtins.readFile ./udev/zepyhr.d;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users= {
        users.void = {
            isNormalUser = true;
            extraGroups = [ "wheel" "audio" "video" "dialout"]; # Enable ‘sudo’ for the user.
            initialPassword = "01011001";
            # shell = pkgs.zsh;
        };
        defaultUserShell=pkgs.zsh;
    };


    qt = {
        enable = true;
        platformTheme = "qt5ct";
        style = "adwaita-dark";
    };
    environment.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt5ct";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

        # XDG_CACHE_HOME = "$HOME/.cache";
        # XDG_CONFIG_DIRS = "/etc/xdg";
        # XDG_CONFIG_HOME = "$HOME/.config";
        # XDG_DATA_DIRS = "/usr/local/share/:/usr/share/";
        # XDG_DATA_HOME = "$HOME/.local/share";
        # XDG_STATE_HOME = "$HOME/.local/state";
    };

    system.stateVersion = "23.11"; # Did you read the comment?
}

