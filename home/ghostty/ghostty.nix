{ pkgs, ... }:
{
    enable = true;
    # Set package to null so nix doesn't attempt to build it. Ghostty will need
    # to be installed elsewhere.
    package = null; 
    settings = import ./config;
    enableFishIntegration = true;
}
