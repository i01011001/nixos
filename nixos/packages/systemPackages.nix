{
pkgs, ...
}:
{
    environment.systemPackages =with pkgs; [
        (import ./source/wideriver.nix)
        (import ./source/hello.nix {inherit pkgs;})
        websocat
        wlr-randr
        mosquitto
        rlwrap
        tree 
        tmux 
        btop
        dconf 
        unzip
        wl-clipboard
        lua
        luajit
        nodejs_22
        ntfs3g
        cargo
        wget
        flex
        bison
        gperf
        python3
        python3Packages.pip
        ninja
        ccache
        dfu-util
        cmake
        gcc
        gnumake
        zig
        swayimg
        brightnessctl
        libnotify
        zathura
        unrar
        mpv
        blender
        arduino-cli
        gimp
        wireshark
        nix-index
        p7zip
        fastfetch
        vscode

        swaybg
        # imagemagick
        lazygit
        # segger-jlink
        # nrfutil
        nrf-command-line-tools
        dtc
        # nrfconnect

        skypeforlinux
        xfce.thunar
        slack

        # xdg-desktop-portal
        # xdg-desktop-portal-wlr
        grim
        slurp

        rnote

        krita

        saleae-logic-2
        cheat
        digital
        lshw

        # pureref
        # neovim
    ];
}
