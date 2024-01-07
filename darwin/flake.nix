{
  description = "macOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = "flake-utils";
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        username = "lethani";
        pkgs = nixpkgs.legacyPackages.${system};
      in
      # with pkgs;
      {
        homeConfigurations = {
          ${username} = home-manager.lib.homeManagerConfiguration {
            inherit username pkgs;
            # darwin is the macOS kernel and aarch64 means ARM, i.e. apple silicon
            # pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            # pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./home.nix ];
          };
        };
      });
}
