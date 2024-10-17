{ pkgs, ... }: { 
    imports =
        [ 
            ./hardware-configuration.nix
            ../modules/nixos 
        ];

    programs.zsh={
        enable = true;
        enableCompletion = false;  
        enableLsColors = false;
        autosuggestions.async = false;
    };
    environment = {
        pathsToLink = [ "/share/zsh" ];
        variables={
            EDITOR = "nvim";
            VISUAL = "nvim";
            # ZDOTDIR="$HOME/.config/zsh/";
            FUNCNEST = 1000;
        };
        variables = {
            QT_QPA_PLATFORMTHEME = "qt5ct";
            _JAVA_AWT_WM_NONREPARENTING=1;

            QT_WAYLAND_DISABLE_WINDOWDECORATION=1;

            WLR_NO_HARDWARE_CURSORS=1;
# WLR_RENDERER="vulkan";
        };
    };

    boot.loader={
        grub={
            enable = true;
            backgroundColor = "#000000";
            device = "nodev";
            useOSProber = false;
            efiSupport = true;
            gfxmodeBios = "auto";
            gfxmodeEfi = "auto";
            splashImage = null;
        };
        systemd-boot.enable = false;

        efi={
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
        };

        timeout=5;
    };


    #    nix-store --optimise
    nix.settings.auto-optimise-store = true;

    fonts = {packages = with pkgs; [
        # nerdFronts
        (nerdfonts.override { fonts = [ "Iosevka" ]; })

        # normal Fonts
        noto-fonts 
        noto-fonts-cjk
        noto-fonts-emoji

        # icon Fonts
        material-design-icons
    ];
    };

    hardware = {
        bluetooth= {
            enable = true; # enables support for Bluetooth
            powerOnBoot = true;
        };
    }; 
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

    services.printing = {
        enable = true;
        cups-pdf.enable = true;
        drivers = [
            # (pkgs.callPackage ../pkgs/driver/dcpj125.nix {inherit pkgs;})
            (import ../customs/driver/dcpj125.nix {inherit pkgs;}).driver
            (import ../customs/driver/dcpj125.nix {inherit pkgs;}).cupswrapper
        ];
    };
    hardware.printers = {
        ensurePrinters = [
            {
                name = "DCP-J125";
                location = "Home";
                deviceUri = "usb://Brother/DCP-J125?serial=BROE2F352003";
                # model = "drv:///sample.drv/generic.ppd";
                model = "brother_dcpj125_printer_en.ppd";
                ppdOptions = {
                    PageSize = "A4";
                };
            }
        ];
    };
    hardware.sane = {
        enable = true;
        brscan4={
            enable = true;
        };
        brscan5 ={
            enable = true;
        };
    };

    services.sshd.enable = true;

    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };

    networking.firewall= {
        enable = true;
        allowedTCPPorts = [22];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config={
        allowUnfree = true; 
        allowBroken = true;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users= {
        users.void = {
            isNormalUser = true;
            extraGroups = [ "wheel" "audio" "video" "dialout" "input" "adbusers" "wireshark" "lp" "scanner" ]; 
            initialPassword = "01011001";
            openssh.authorizedKeys.keys = [
                "SHA256:6YCGgPIhDB2gq8bopDUZKZ2Mj1MEAWBGvBuX9NBPyLw root@nixos"];
        };
        defaultUserShell=pkgs.zsh;
    };
    programs.adb.enable = true;

    qt = {
        enable = true;
        platformTheme = "qt5ct";
        style = "adwaita-dark";
    };

    nixpkgs.config= {
        segger-jlink.acceptLicense = true;
        permittedInsecurePackages = [ "segger-jlink-qt4-796s" ];
    };

    system.stateVersion = "23.11"; # Did you read the comment?
}


