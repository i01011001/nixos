{
    imports = [
        ./systemPackages.nix
        ./nix-ld.nix
        ./extra.nix
        ./nh.nix
        ./opentabletdriver.nix
        ./nvidia.nix
        # ./nouveau.nix
        ./fzf.nix
        # ./emacs.nix
        # ./awesome.nix
    ];

    programs.zsh.enable =true;
}

