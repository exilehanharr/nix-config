{ self, config, pkgs, inputs, user, hostName, ... }:

{
  imports = [
    ../../modules/darwin/homebrew.nix
  ];

  networking.hostName = hostName;
  programs.zsh.enable = true;

  users.users.${user} = {
    name  = user;
    home  = "/Users/${user}";
    shell = pkgs.zsh;
  };

  system = {
    checks.verifyNixPath  = false;
    primaryUser           = "${user}";
    stateVersion          = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    defaults              = {
      LaunchServices = {
        LSQuarantine = false;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;

        InitialKeyRepeat = 15;
        KeyRepeat        = 2;
      };
      screensaver = {
        askForPassword      = true;
        askForPasswordDelay = 0;
      };
      dock = {
        autohide                = true;
        show-recents            = false;
        launchanim              = true;
        mouse-over-hilite-stack = true;
        orientation             = "bottom";
        tilesize                = 64;

        mru-spaces = false;
        # expose-animation-duration = 0.1;
        mineffect               = "genie";
        minimize-to-application = true;
        show-process-indicators = true;
      };
      finder = {
        _FXSortFoldersFirst   = true;
        AppleShowAllFiles     = true;
        FXDefaultSearchScope  = "SCcf";
        FXPreferredViewStyle  = "Nlsv";
        ShowPathbar           = true;
        ShowStatusBar         = true;
      };
      trackpad = {
        TrackpadThreeFingerDrag = true;
      };
    };
  };

  security = {
    pam.services.sudo_local.touchIdAuth = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [ 
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    optimise = {
      automatic = true;
      interval  = { Weekday = 0; Hour = 3; Minute = 15; };
    };
    gc = {
      automatic = true;
      interval  = { Weekday = 0; Hour = 2; Minute = 0; };
      options   = "--delete-older-than 30d";
    };
  };

  nix-homebrew = {
    inherit user;
    enable = true;
    taps = {
      "homebrew/homebrew-core"    = inputs.homebrew-core;
      "homebrew/homebrew-cask"    = inputs.homebrew-cask;
      "homebrew/homebrew-bundle"  = inputs.homebrew-bundle;
    };
    enableRosetta = false;
    autoMigrate   = true;
    mutableTaps   = false;
  };
}
