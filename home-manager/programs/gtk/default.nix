{pkgs, ...}:
{
  gtk= {
    enable = true;
    font ={
      name = "Iosevka Nerd Font Medium ";
      size = 11;
    };
    theme = {
      package = pkgs.materia-theme;
      name = "Materia-dark-compact";
    };
    gtk3.extraCss="
      headerbar.default-decoration {
        /* You may need to tweak these values depending on your GTK theme */
        margin-bottom: 50px;
        margin-top: -100px;
      }
    window.csd,
      window.csd decoration {
        box-shadow: none;
      }
    ";
    gtk3.extraConfig={
      gtk-dialogs-use-header=false;
    };
  };
}
