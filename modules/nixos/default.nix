{pkgs,  ...}: {
    imports = [
        ./systemPackages
        ./nix-ld
        ./extra
        ./nh
        ./opentabletdriver
        ./nvidia
        ./fzf
        ./wireshark
        ./awesome
    ];
}


