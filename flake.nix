{
  description = "Timothy's nixos flake :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    ax-shell = {
      url = "github:poogas/Ax-Shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.timothy.imports = [
            ./home-manager/home.nix
            inputs.catppuccin.homeModules.catppuccin
          ];

          home-manager.extraSpecialArgs = { 
            inherit inputs;
          };
        }
        inputs.auto-cpufreq.nixosModules.default
      ];
    };

    # homeConfigurations.nixos =
    #   home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     modules = [
    #       ./home-manager/home.nix
    #       inputs.catppuccin.homeModules.catppuccin
    #     ];
    #     extraSpecialArgs = {
    #       inherit inputs;
    #     };
    #   };
  };
}
