{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  # Пакеты для разработки
  home.packages = with pkgs; [
    openconnect
  ];

  # Git настройки для работы
  # programs.git = {
  #   enable = true;
  #   userName = "Your Work Name";
  #   userEmail = "work@company.com";
  #   extraConfig = {
  #     init.defaultBranch = "main";
  #     pull.rebase = true;
  #     url."git@github.com:company/".insteadOf = "https://github.com/company/";
  #   };
  # };

  # VSCode для разработки (полный набор)
  # programs.vscode = {
  #   enable = true;
  #   extensions = with pkgs.vscode-extensions; [
  #     # Языки
  #     ms-python.python
  #     golang.go
  #     rust-lang.rust-analyzer
  #     ms-vscode.vscode-typescript-next
      
  #     # Docker & Kubernetes
  #     ms-azuretools.vscode-docker
  #     ms-kubernetes-tools.vscode-kubernetes-tools
      
  #     # Git
  #     eamodio.gitlens
      
  #     # Темы и UI
  #     pkief.material-icon-theme
  #     zhuangtongfa.material-theme
  #   ];
  #   userSettings = {
  #     "workbench.colorTheme" = "Material Theme Darker High Contrast";
  #     "editor.fontSize" = 12;
  #     "editor.rulers" = [ 80 120 ];
  #     "python.defaultInterpreterPath" = "${pkgs.python311}/bin/python";
  #     "go.goroot" = "${pkgs.go}/share/go";
  #   };
  # };

  # Дополнительные настройки для разработки
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  # };
} 