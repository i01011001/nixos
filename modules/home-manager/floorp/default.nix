{
    programs.floorp = {
        enable = true;

        profiles = {
            void = {
                settings= {
                    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
# "browser.uidensity" = 1;
                    "browser.compact.show" = true;
                    "browser.compactmode.show" = true;
                    # "sidebar.animation.enabled" = false;
                    # "layers.offmainthreadcomposition.log-animations" = false;
                    # "layout.css.prefixes.animations" = false;
                    # "layout.css.animation-composition.enabled" = false;
                    # "browser.suppress_first_window_animation" = false;
                    "floorp.browser.sidebar.enable"=false;
                    "floorp.browser.sidebar.is.displayed"=false	;
                    "floorp.browser.sidebar.right"=false ;
                    "floorp.browser.tabbar.settings"=2;
                    "floorp.tabbar.style"=2;	
                    "font.name.monospace.x-western"="Iosevka Nerd Font Mono";
                    "font.name.sans-serif.x-western"="Iosevka Nerd Font Mono";	
                    "font.name.serif.x-western"="Iosevka Nerd Font Mono";

                    "floorp.Tree-type.verticaltab.optimization"=true;
                    "floorp.browser.tabs.verticaltab"=true;	
                    "floorp.browser.tabs.verticaltab.right"=true;
                    "floorp.verticaltab.hover.enabled" = true;
                    "floorp.browser.tabs.verticaltab.width"  = 360;
                };
                userChrome = builtins.readFile ./userChrome.css;
            };
        };

    };
}
