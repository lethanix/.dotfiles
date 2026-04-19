{
	description = "NixOS to GTD";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		vicinae.url = "github:vicinaehq/vicinae";
		vicinae-extensions.url = "github:vicinaehq/extensions";
	};

	outputs = { self, nixpkgs, home-manager, ...} @ inputs: {
		nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./system/configuration.nix
				home-manager.nixosModules.home-manager {
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.lethanix = import ./users/lethanix/home.nix;
						backupFileExtension = "bak";
					};
				}
			];
		};
	};
}
