with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation {
    name = "wideriver";
    src = fetchurl {
        url = "https://github.com/alex-courtis/wideriver/archive/refs/tags/1.2.0.tar.gz";
        hash = "sha256-TJVtBXK8rR6LdnUXNGFv1g8E9T9FDl6Kg1xFgQNHpDo=";
    };
    nativeBuildInputs = [
        pkg-config
        wayland
        xwayland
    ];

    installPhase = ''
        mkdir -p $out/bin
        cp wideriver $out/bin/wideriver
        '';
}

