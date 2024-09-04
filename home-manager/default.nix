{
	lib,
		...
}:{
	imports = [
        ./programs/foot.nix
        ./programs/firefox/firefox.nix
        ./programs/river/river.nix
        ./programs/nixvim/nixvim.nix
        ./programs/mako.nix
        ./programs/ripgrep.nix
        ./programs/fd.nix
        ./programs/fzf.nix
        ./programs/shell/zsh.nix

        ./programs/bemenu.nix
        ./programs/cursor.nix
        ./programs/gtk.nix
        # ./alacritty.nix
        # ./tofi.nix
        # ./flameshot.nix
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
