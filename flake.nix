{
    description = "Void's flake setup";

    inputs = {
        nixpkgs= {
            # url = "nixpkgs/nixos-unstable";
            url = "github:nixos/nixpkgs?ref=nixos-unstable";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
        };

        nixvim={
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ...}
        @ inputs:
        let 
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
            {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                system = "${system}";
                modules = [ 
                    ./nixos 
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useUserPackages = true;
                            useGlobalPkgs = true;
                            extraSpecialArgs = { inherit inputs; };
                            users.void = (import ./home-manager );
                        };
                    }
                ];
            };
            formatter.${system} = pkgs.void;
        };

}
