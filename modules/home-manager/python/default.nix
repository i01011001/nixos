{pkgs}:{
    home.packages = [
        (pkgs.python311.withPackages (
            ppkgs: [
                ppkgs.pyserial
                ppkgs.pip
                ppkgs.psutil
            ]
        ))
    ];
    }
