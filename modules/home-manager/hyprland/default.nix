{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraConfig = builtins.readFile  ./default.nix;
    };
}
