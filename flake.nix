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
    };

    outputs = { nixpkgs, home-manager, ...}
        @ inputs:
        let 
            hostname = "nixos";
            username = "void";
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
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
                            users.${username} = (import ./home-manager );
                        };
                    }
                ];
            };
        };
}

