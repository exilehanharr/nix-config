{ config, pkgs, ... }:

{
  home = {
    username = "your-username";
    homeDirectory = "/Users/your-username";
    stateVersion = "25.05";
  };

  # Общие программы для всех профилей
  programs.home-manager.enable = true;
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
} 