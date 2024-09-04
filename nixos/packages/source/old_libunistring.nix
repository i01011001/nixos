with import <nixpkgs> {};

stdenv.mkDerivation rec {
    pname = "libunistring";
    version = "0.9.10";

    src = fetchurl {
        url = "mirror://gnu/libunistring/${pname}-${version}.tar.gz";
        sha256 = "sha256-qC5bMzM5qI6kYI5GNUeaHPsuAar7kl4SkLZXENQ/YQs=";
    };

    outputs = [ "out" "dev" "info" "doc" ];

    strictDeps = true;
    propagatedBuildInputs = lib.optional (!stdenv.isLinux) libiconv;

    configureFlags = [
        "--with-libiconv-prefix=${libiconv}"
    ];

    doCheck = false;

    enableParallelChecking = false;
    enableParallelBuilding = true;

}
