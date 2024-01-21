{
  description = "macOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "flake-utils";
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        homeConfigurations = {
          lethani = home-manager.lib.homeManagerConfiguration {
            inherit system pkgs;
            # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
            # pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./home.nix ];
          };
        };

      }
    );
}
