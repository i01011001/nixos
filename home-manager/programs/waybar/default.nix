{pkgs, ...}:{
    programs.waybar={
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [
                    "eDP-1"
                    "HDMI-A-1"
                ];
                modules-left = [ "river/workspaces" "wlr/taskbar" ];
                modules-center = [ "river/window" ];
                modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];

                # "river/workspaces" = {
                #     disable-scroll = true;
                #     all-outputs = true;
                # };
                # "custom/hello-from-waybar" = {
                #     format = "hello {}";
                #     max-length = 40;
                #     interval = "once";
                #     exec = pkgs.writeShellScript "hello-from-waybar" ''
                #        echo "from within waybar"
                #        '';
                # };
            };
        };
        systemd.target = "river-session.target";
    };
}
