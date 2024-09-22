{pkgs}:
pkgs.stdenv.mkDerivation rec {
    pname = "libunistring";
    version = "0.9.10";

    src = pkgs.fetchurl {
        url = "mirror://gnu/libunistring/${pname}-${version}.tar.gz";
        sha256 = "sha256-qC5bMzM5qI6kYI5GNUeaHPsuAar7kl4SkLZXENQ/YQs=";
    };

    outputs = [ "out" "dev" "info" "doc" ];

    strictDeps = true;
    propagatedBuildInputs = pkgs.lib.optional (!pkgs.stdenv.isLinux) pkgs.libiconv;

    configureFlags = [
        "--with-libiconv-prefix=${pkgs.libiconv}"
    ];

    doCheck = false;

    enableParallelChecking = false;
    enableParallelBuilding = true;

}


