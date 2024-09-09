{
	lib,
    inputs,
		...
}:{
	imports = [
        ./programs
    ];

    home = {
        username = "void";
        homeDirectory = lib.mkForce "/home/void/";
    };

    # Enable home-manager and git
	programs.home-manager= {
		enable = true;
	};
	programs.git.enable = true;

# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

	home.stateVersion = "24.11";
}
