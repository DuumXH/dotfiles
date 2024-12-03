{
	description = "duumxh flake config";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		homebrew-core = {
			url = "github:homebrew/homebrew-core";
			flake = false;
		};
		homebrew-cask = {
			url = "github:homebrew/homebrew-cask";
			flake = false;
		};
		homebrew-bundle = {
			url = "github:homebrew/homebrew-bundle";
			flake = false;
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
	};
	
	outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, home-manager }: {
		darwinConfigurations."XH-MacBook" = nix-darwin.lib.darwinSystem { 
			system = "aarch64-darwin";
			modules = [ 
				./mbp.nix

				nix-homebrew.darwinModules.nix-homebrew {
					nix-homebrew = {
						enable = true;
						enableRosetta = true;
						user = "duumxh";
						taps = {
							"homebrew/homebrew-core" = homebrew-core;
							"homebrew/homebrew-cask" = homebrew-cask;
							"homebrew/homebrew-bundle" = homebrew-bundle;
						};
						mutableTaps = false;
					};
				}

				home-manager.darwinModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.duumxh = import ./home.nix;
				}
			];
		};
		darwinPackages = self.darwinConfigurations."XH-MacBook".pkgs;
    };
}
