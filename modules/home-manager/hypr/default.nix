{inputs,pkgs, ...}:{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraConfig = builtins.readFile  ./hyprland.conf;
        plugins = [
            # inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
            inputs.hy3.packages.x86_64-linux.hy3
        ];

    };
}
