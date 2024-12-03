{ config, lib, pkgs, ... }:

{
	homebrew = {
		enable = true;

		onActivation.autoUpdate = true;
		onActivation.upgrade = true;

		casks = [ 
			"telegram"
			"visual-studio-code" 
			"obs"
			"qbittorrent@lt20"
			"krita"
			"musicbrainz-picard" 
			"arc" 
			"tailscale"
			"blender" 
			"UTM" 
			"Keka" 
			"Secretive" 
			"Loop" 
			"LinearMouse" 
			"HiddenBar" 
			"WezTerm" 
			"Obsidian" 
			"RayCast" 
			"Discord" 
			"Element" 
			"IINA"
			"appcleaner"
		];

		masApps = {
			"Bitwarden" = 1352778147;
			"DropOver" = 1355679052;
		};
	};

	users.users.duumxh.home = "/Users/duumxh";

	services.nix-daemon.enable = true;

	nix.settings.experimental-features = "nix-command flakes";

	programs.zsh.enable = true;
	programs.gnupg.agent.enable = true;

	security.pam.enableSudoTouchIdAuth = true;
	system.stateVersion = 5;
	system.defaults = {
		screencapture.type = "png";
		dock = {
			autohide = true;
			mineffect = "scale";
			minimize-to-application = true;
			mru-spaces = false;
			show-recents = false;
			tilesize = 48;
		};

		finder = {
			AppleShowAllFiles = true;
			AppleShowAllExtensions = true;
			ShowPathbar = true;
			ShowStatusBar = true;
		};
	};

	nix.configureBuildUsers = true;

	nixpkgs.hostPlatform = "aarch64-darwin";
	nixpkgs.config.allowUnfree = true;
}
