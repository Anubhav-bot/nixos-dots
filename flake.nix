{
  description = "Timothy's nixos flake :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { self, nixpkgs, home-manager, auto-cpufreq, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkSystem = hostPath: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          hostPath
          ./overlays/default.nix
          ./modules/packages/default.nix
          ./modules/services/default.nix
          ./modules/wms/default.nix
          auto-cpufreq.nixosModules.default
          home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.timothy.imports = [
              ./home/default.nix
            ];

            home-manager.extraSpecialArgs = { inherit inputs system; };
          }
        ];
      };
    in
    {
      formatter.${system} = pkgs.alejandra;

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ alejandra ];
      };

      nixosConfigurations = {
        homeNiri = mkSystem ./hosts/homeNiri/default.nix;
        homeHyprland = mkSystem ./hosts/homeHyprland/default.nix;
        homeSway = mkSystem ./hosts/homeSway/default.nix;
      };
    };
}
