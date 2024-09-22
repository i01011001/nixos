{
pkgs, ...
}:
{
    environment.systemPackages =with pkgs; [
        wideriver
        websocat
        mosquitto
        rlwrap
        tree 
        tmux 
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
        (python3.withPackages(ps: with ps; [ pip pyserial psutil ]))
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
        nix-index
        p7zip
        fastfetch
        vscode

        #### WAYLAND
        grim slurp wl-clipboard way-displays

        lazygit

        #### NRF
        nrf-command-line-tools segger-jlink nrfconnect

        skypeforlinux
        xfce.thunar
        slack

        rnote

        krita

        saleae-logic-2
        digital
        lshw

        thunderbird
        scrcpy
    ];

    services.udev.packages = with pkgs;[ 
        saleae-logic-2
        segger-jlink
    ];

}
