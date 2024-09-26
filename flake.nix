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
            systems = [
                "x86_64-linux"
                "aarch64-linux"
            ];
            # pkgs = nixpkgs.legacyPackages.${systems};

            forAllSystems = nixpkgs.lib.genAttrs systems;

        in
            {
            # overlays = import ./overlays {inherit inputs;};

            formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.${hostname});

            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                system = forAllSystems;
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
