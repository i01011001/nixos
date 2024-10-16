{
    description = "Void's flake setup";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        home-manager= {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim={
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
        split-monitor-workspaces = {
            url = "github:Duckonaut/split-monitor-workspaces";
            inputs.hyprland.follows = "hyprland";         
        };

        # firefox = {
        #     url = "github:nix-community/flake-firefox-nightly";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
    };

    outputs = { nixpkgs, home-manager, ...}
    @ inputs:
        let 
            hostname = "nixos";
            username = "void";
            # system = "x86_64-linux";
            # pkgs = nixpkgs.legacyPackages.${system};
        in
            {

            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; }; 
                modules = [ 
                    ./nixos 
                    ./overlays

                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useUserPackages = true;
                            useGlobalPkgs = true;
                            extraSpecialArgs = { inherit inputs; };
                            users.${username} = {
                                imports = [
                                    ./home-manager
                                    ./modules/home-manager/hypr
                                ] ;
                            };
                        };
                    }
                ];
            };
        };
}

