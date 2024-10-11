{inputs,pkgs, ...}:{
    wayland.windowManager.hyprland = {
        enable = true;
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        systemd.enable = true;
        xwayland.enable = true;

        plugins = [
            inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
            # pkgs.hyprlandPlugins.hy3
            # inputs.hy3.packages.x86_64-linux.hy3 
            # "${inputs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so"

        ];

        extraConfig = builtins.readFile ./hyprland.conf;

    };
}
