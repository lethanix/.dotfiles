{
  description = "macOS flake";

  inputs = {
  	nixpkgs.url = "nixpkgs";	
	flake-utils.url = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ...}:
	flake-utils.lib.eachDefaultSystem (system:
		let pkgs = nixpkgs.legacyPackages.${system};
		in
  {

    packages.hello = pkgs.hello;


  });
}
