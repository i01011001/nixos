{lib, ...}:{
    imports = [
        ./foot.nix
        ./firefox/firefox.nix
        ./river/river.nix
        ./nixvim/nixvim.nix
        ./mako.nix
        ./ripgrep.nix
        ./fd.nix
        ./fzf.nix
        ./shell/zsh.nix

        ./bemenu.nix
        ./cursor.nix
        ./gtk.nix
        ./alacritty.nix
        ./flameshot.nix
        ./yazi.nix
    ];
    programs= {
        alacritty.enable = lib.mkForce false;
    };
    services= {
           flameshot.enable = lib.mkForce false;
        };

}
