{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  # Пакеты для домашнего использования
  home.packages = with pkgs; [
    youtube-dl
    ffmpeg
    imagemagick
    pandoc
    # Медиа и персональные утилиты
  ];

  # Git настройки для домашнего использования
  programs.git = {
    enable = true;
    userName = "Your Personal Name";
    userEmail = "personal@email.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # VSCode для домашнего использования (минимальный набор)
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.vscode-json
    ];
    userSettings = {
      "workbench.colorTheme" = "Default Light+";
      "editor.fontSize" = 14;
    };
  };
} 