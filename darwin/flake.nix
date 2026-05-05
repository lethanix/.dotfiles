{
  description = "macOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, nixpkgs-stable, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pkgs-stable = import nixpkgs-stable { inherit system; };
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        packages = {

          homeConfigurations = {
            lethani = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              modules = [ ./home.nix ];

              # Optionally use extraSpecialArgs
              # to pass through arguments to home.nix
              extraSpecialArgs = {
                inherit pkgs;
                inherit pkgs-stable;
              };
            };
          };

        };
      }
    );
}
