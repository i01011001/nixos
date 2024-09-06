{pkgs,lib,  ...}:
let 
    name = "libunistring";
    ver = "0.9.10";
in
pkgs.stdenv.mkDerivation  {
    pname = "${name}";
    version = "${ver}";

    src = pkgs.fetchurl {
        url = "mirror://gnu/libunistring/${name}-${ver}.tar.gz";
        sha256 = "sha256-qC5bMzM5qI6kYI5GNUeaHPsuAar7kl4SkLZXENQ/YQs=";
    };

    outputs = [ "out" "dev" "info" "doc" ];

    strictDeps = true;
    propagatedBuildInputs = lib.optional (!pkgs.stdenv.isLinux) pkgs.libiconv;

    configureFlags = [
        "--with-libiconv-prefix=${pkgs.libiconv}"
    ];

    doCheck = false;

    enableParallelChecking = false;
    enableParallelBuilding = true;

}
