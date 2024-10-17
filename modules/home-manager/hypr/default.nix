{inputs,pkgs, ...}:{
    wayland.windowManager.hyprland = {
        enable = true;
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        package = pkgs.hyprland;
        systemd.enable = true;
        xwayland.enable = true;

        plugins = [
            inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
            # pkgs.hyprlandPlugins.hy3
        ];

        extraConfig = builtins.readFile ./hyprland.conf;

    };
}
