{lib, ...}:{
    imports = [
        ./systemPackages.nix
        ./nix-ld.nix
        ./extra.nix
        ./nh.nix
        ./opentabletdriver.nix
        ./nvidia.nix
        ./fzf.nix
        ./emacs.nix
        ./source/old_libunistring.nix
    ];

    programs.zsh.enable =true;

    services= {
        emacs.enable = lib.mkForce false;
    };
}

