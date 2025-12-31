{
  description = "Benjmanxd's flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, spicetify-nix, ... } :
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    config = {
      allowUnfree = true;
      # allowUnsupportedSystem = true;
    };
    pkgs = import nixpkgs {
      inherit system;
      inherit config;
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      inherit config;
    };
  in {
    nixosConfigurations = {
      Main = lib.nixosSystem {
        inherit system;
        specialArgs = {};
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.benjmanxd = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs;
              inherit pkgs-unstable;
              inherit spicetify-nix;
            };
          }
        ];
      };
    };
  };
}
