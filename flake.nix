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

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        hy3 = {
            url = "github:outfoxxed/hy3"; 
            inputs.hyprland.follows = "hyprland";
        };
    };

    outputs = { nixpkgs, home-manager, hyprland, hy3, ...}
        @ inputs:
        let 
            hostname = "nixos";
            username = "void";
            systems = [
                "x86_64-linux"
                "aarch64-linux"
            ];
            pkgs = nixpkgs.legacyPackages.x86_64-linux;

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

                     # home-manager.nixosModules.home-manager
                     # {
                     #     home-manager = {
                     #         useUserPackages = true;
                     #         useGlobalPkgs = true;
                     #         extraSpecialArgs = { inherit inputs; };
                     #         users.${username} = (import ./home-manager );
                     #     };
                     # }

                    #(import ./hyprland-config.nix)

                    #hyprland.homeManagerModules.default
                    #{
                    #    wayland.windowManager.hyprland = {
                    #        enable = true;
                    #        plugins = [ hy3.packages.x86_64-linux.hy3 ];
                    #        #recommendedEnvironment = true;
                    #        systemd.enable = true;
                    #        xwayland.enable = true;
                    #    };
                    #}

                ];
            };
           homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
                pkgs= pkgs;

               extraSpecialArgs = {inherit inputs ;};
               modules = [
                   (import ./home-manager/default.nix)
                   # Import the Hyprland specific configuration
                   (import ./hyprland-config.nix)
                   # Integrate default Hyprland Home Manager modules
                   hyprland.homeManagerModules.default
                   {
                       # Configure the Hypr window manager
                       wayland.windowManager.hyprland = {
                           enable = true;
                           # Use the hy3 plugin with Hypr
                           plugins = [ hy3.packages.x86_64-linux.hy3 ];
                           #recommendedEnvironment = true;
                           systemd.enable = true;
                           xwayland.enable = true;
                       };
                   }

               ];
           };
        };
}
