{ config, pkgs, lib, ... }:

{

	home = {
		stateVersion = "24.05";
		packages = with pkgs; [
			neovim
			bat
			teleport
			ansible
			opentofu
			yandex-cloud
			nerd-fonts.jetbrains-mono
		];
	};

	programs.git = {
    		enable = true;
    		userName = "Den Afanasyev";
    		userEmail = "git@duumxh.me";
  	};

	programs.zsh = {
		enable = true;
		antidote.enable = true;
		antidote.plugins = [
			"romkatv/powerlevel10k"
			"zsh-users/zsh-syntax-highlighting"
			"zsh-users/zsh-completions"
			"zsh-users/zsh-autosuggestions"
			"Aloxaf/fzf-tab"
		];
		syntaxHighlighting.enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		initExtraFirst = '' source ~/.p10k.zsh '';
		shellAliases = {
			switch = "darwin-rebuild switch --flake ~/.nix";
		};
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.eza = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.zellij = {
		enable = true;
		#enableZshIntegration = true;
	};

	programs.bat = {
		enable = true;
	};

	programs.home-manager.enable = true;
}
