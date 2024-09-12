{
pkgs, ...
}:
{
    environment.systemPackages =with pkgs; [
        # (import ./source/wideriver.nix)
        # (import ./source/hello.nix {inherit pkgs;})
        wideriver
        websocat
        mosquitto
        rlwrap
        tree 
        tmux 
        btop
        dconf 
        unzip
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

        # wayland native
        grim slurp wl-clipboard way-displays

        # imagemagick
        lazygit
        # segger-jlink
        # nrfutil
        # nrf-command-line-tools
        # dtc
        # nrfconnect

        skypeforlinux
        xfce.thunar
        slack

        rnote

        krita

        saleae-logic-2
        # cheat
        digital
        lshw

        thunderbird
        scrcpy
    ];
    services.udev.packages = [ 
        pkgs.saleae-logic-2
        # pkgs.android-udev-rules
    ];

}
