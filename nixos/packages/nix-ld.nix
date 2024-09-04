{
    pkgs, ...
}:
{
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        (import ./source/old_libunistring.nix)
            stdenv.cc.cc
            openssl
            zlib
            fuse3
            icu
            nss
            openssl
            curl
            expat
            libusb1
            libidn2
            libyaml
            libnghttp2
            gnutls
            gmp

            glib
            # glibc
            e2fsprogs

            libxcrypt-legacy
            libunistring
            gobject-introspection
            ];
}
