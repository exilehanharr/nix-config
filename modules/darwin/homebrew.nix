{ config, pkgs, ... }:

let
  casks = import ./homebrew/casks.nix;
  brews = import ./homebrew/brews.nix;
  taps  = import ./homebrew/taps.nix;
in
{
  homebrew = {
    enable  = true;

    caskArgs.no_quarantine = true;

    brews   = brews;
    casks   = casks;
    taps    = builtins.attrNames config.nix-homebrew.taps ++ taps;

    onActivation = {
      autoUpdate  = true;
      upgrade     = false;
      cleanup     = "zap";
    };
  };
}
