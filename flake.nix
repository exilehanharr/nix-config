{
  description = "Configuration for macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nix-darwin
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-homebrew
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{
    self,
    darwin,
    nixpkgs,
    home-manager,
    nix-homebrew,
    homebrew-bundle,
    homebrew-core,
    homebrew-cask
  }:
  let
    user          = "hanharr";
    darwinSystem  = "aarch64-darwin";
    hostName      = "rocinante";
    commonArgs    = {
      inherit inputs user self hostName;
    };
  in
  {
    darwinConfigurations.${darwinSystem} = darwin.lib.darwinSystem {
      system = darwinSystem;
      specialArgs = commonArgs;
      modules = [
        nix-homebrew.darwinModules.nix-homebrew
        ./hosts/darwin
      ];
    };
  };
}
