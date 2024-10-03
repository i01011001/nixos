{pkgs, ...}:
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-bin;
      profiles = {
        void = {
          settings= {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.uidensity" = 1;
            "browser.compact.show" = true;
            "browser.compactmode.show" = true;
          };
          userChrome = builtins.readFile ./userChrome.css;
        };
      };
    };
  };
}
