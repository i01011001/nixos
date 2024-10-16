# hyprland-config.nix
{ config, pkgs, ... }: {
  wayland.windowManager.hyprland.extraConfig = ''
    # Monitor Configuration
    monitor=,preferred,auto,1
    #monitor=,3840x2160,1920x0,1

    # Executions on Startup
    exec-once = rm -f $XDG_RUNTIME_DIR/wob.sock && mkfifo $XDG_RUNTIME_DIR/wob.sock && tail -f $XDG_RUNTIME_DIR/wob.sock | wob # Initialise wob
    exec-once = blueman-applet          # Launch blueman
    exec-once = hyprpaper               # Start hyprpaper
    exec-once = systemctl --user import-environment # Ensure environment variables for user systemd units
    exec-once = mako                    # Launch mako
    # exec-once = hyprctl setcursor DMZ-White 24 # Set cursor
    # exec-once = waybar                  # Launch waybar
    exec-once = clipse -listen

    # Environmental Variables
    env = WLR_NO_HARDWARE_CURSORS,1

    # Input Configuration
    input {
        sensitivity = 0.5
        kb_layout = us                  # Keyboard layout
        touchpad {
            natural_scroll = true       # Touchpad natural scroll
            clickfinger_behavior = 1    # Click finger behavior
        }
        follow_mouse = 0                # Disable focus change on hover
        float_switch_override_focus = 0 # Disable focus change on float  
    }

    # General Configuration
    general {
        gaps_in = 6              # Inner gaps
        gaps_out = 7             # Outer gaps
        border_size = 3          # Border size
        col.active_border = rgba(5289E2ee) rgba(6897BBee) 45deg # Active border color
        col.inactive_border = rgba(595959aa) # Inactive border color
        layout = hy3                    # Layout type
        no_cursor_warps = true          # No cursor warps
    }

    # Misc Configuration
    misc {
        disable_hyprland_logo = true    # Disable hyprland logo
        disable_splash_rendering = true # Disable splash rendering
        mouse_move_focuses_monitor = false # Disable move monitor focus with mouse
    }
    
    # Window Rules
    # windowrulev2 = opacity 0.7 0.7,title:^(Volume Control)$
    # windowrulev2 = opacity 0.8 0.8,title:^(Bluetooth Devices)$
    # windowrulev2 = opacity 0.8 0.8,title:^(wdisplays)$
    # windowrulev2 = opacity 0.7 0.7,class:^(google-chrome)$
    # windowrulev2 = opacity 0.9 0.9,class:^(emacs)$
    # windowrulev2 = opacity 0.7 0.7,class:^(Slack)$
    # windowrulev2 = opacity 0.8 0.8,class:^(pavucontrol)$
    # windowrulev2 = opacity 0.7 0.7,class:^(Code)$
    # windowrulev2 = opacity 0.8 0.8,class:^(docker-compose)$
    # windowrulev2 = opacity 0.7 0.7,class:^(Insomnia)$
    # windowrulev2 = opacity 0.7 0.7,class:^(helix)$
    windowrulev2 = float,class:(clipse)
    windowrulev2 = size 622 652,class:(clipse)

    # Decoration Configuration
    decoration {
        rounding = 3                   # Rounding factor
        blur {
            enabled = true              # Enable blur
            size = 3                    # Blur size
            passes = 2                  # Blur passes
        }
        drop_shadow = true              # Enable drop shadow
        shadow_range = 4                # Shadow range
        shadow_render_power = 3         # Shadow render power
        col.shadow = rgba(1a1a1aee)     # Shadow color
    }
    
    # Animations Configuration
    animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05 # Bezier curve settings
        animation = windows, 1, 7, myBezier    # Windows animation
        animation = windowsOut, 1, 7, default, popin 80% # Windows out animation
        animation = border, 1, 10, default          # Border animation
        animation = borderangle, 1, 8, default      # Border angle animation
        animation = fade, 1, 7, default              # Fade animation
        animation = workspaces, 1, 6, default       # Workspaces animation
    }

    # Master Configuration
    master {
        new_is_master = true                # Set new window as master
    }

    # Gestures Configuration
    gestures {
        workspace_swipe = false             # Workspace swipe gesture
    }

    # Device Configuration
    # device:epic-mouse-v1 {
    #     sensitivity = -0.5                 # Sensitivity setting
    # }

    # Main Modification Key
    $mainMod = SUPER
    
    # System Control Bindings
    bind = $mainMod_SHIFT, C, exec, hyprctl reload && pkill waybar && nohup waybar > /dev/null 2>&1 & pkill mako && nohup mako > /dev/null 2>&1 &
    # Reload system config
    bind = $mainMod_SHIFT, C, killactive           # Kill active window
    bind = $mainMod, BACKSPACE, hy3:makegroup, opposite, ephemeral # Toggle split
    bind = $mainMod_SHIFT, Q, exit                 # Exit system
    bind = $mainMod_SHIFT, Space, togglefloating  # float current window

    # Application Bindings
    bind = $mainMod_SHIFT, RETURN, exec, foot      # Open terminal
    # bind = $mainMod, SPACE, exec, rofi -show drun  # Launch rofi
    # bind = $mainMod, S, exec, pavucontrol          # Open sound control
    bind = $mainMod, F, exec, firefox # Launch Chrome
    
    # Audio Control Bindings
    bind = , XF86AudioRaiseVolume, exec, amixer sset Master unmute; exec amixer sset Master 5%+ | sed -En 's/.*\[([0-9]+)%\].*/\1/p' | head -1 > $XDG_RUNTIME_DIR/wob.sock
    bind = , XF86AudioLowerVolume, exec, amixer sset Master unmute; exec amixer sset Master 5%- | sed -En 's/.*\[([0-9]+)%\].*/\1/p' | head -1 > $XDG_RUNTIME_DIR/wob.sock
    bind = , XF86AudioMute, exec, amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > $XDG_RUNTIME_DIR/wob.sock

    # Brightness Control Bindings
    bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
    bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%- -n 10%

    # Screenshot Binding
    bind = $mainMod, P, exec, grim -g "$(slurp)" - | swappy -f -

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, hy3:movefocus, l
    bind = $mainMod, right, hy3:movefocus, r
    bind = $mainMod, up, hy3:movefocus, u
    bind = $mainMod, down, hy3:movefocus, d

    # Move window with mainMod + SHIFT + arrow keys
    bind = $mainMod SHIFT, left, hy3:movewindow, l
    bind = $mainMod SHIFT, right, hy3:movewindow, r
    bind = $mainMod SHIFT, up, hy3:movewindow, u
    bind = $mainMod SHIFT, down, hy3:movewindow, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Clipse bind 
    bind = SUPER, V, exec, alacritty --class clipse -e 'clipse'

    # weather CLI
    bind = SUPER, W, exec, alacritty -e sh -c 'sleep 0.1; weather; sleep 1000000'

    # Lid switch event
    # bindl=,switch:Lid Switch,exec,swaylock --clock --image //home/michael/Pictures/screensaver.jpg # Lock screen 

    # Full screen a windoc
    bind=SUPER,F,fullscreen

    # Resize window & move floating window
    bindm = $mainMod, mouse:272, resizewindow
    bindm = CTRL, mouse:273, movewindow
  '';
}
