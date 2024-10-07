{pkgs, ...}:
{
    gtk= {
        enable = true;
        font ={
            name = "Iosevka Nerd Font Mono";
            size = 11;
        };
        theme = {
            # package = pkgs.materia-theme;
            # name = "Materia-dark-compact";
            package = pkgs.flat-remix-gtk;
            name = "Flat-Remix-GTK-Grey-Darkest";
        };
        cursorTheme = {
            # name = "phinger-cursors-dark";
            # package = pkgs.phinger-cursors;
            # size = 24;
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 16;  
        };
        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };
        gtk3.extraCss=builtins.readFile ./gtk.css;
        gtk3.extraConfig={
            gtk-dialogs-use-header=false;
        };
        gtk4.extraCss=builtins.readFile ./gtk.css;
        gtk4.extraConfig={
            gtk-dialogs-use-header=false;
        };
    };
}
