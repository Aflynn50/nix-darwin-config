{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin = {
        url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#842f57432ec3
    darwinConfigurations."842f57432ec3" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./configuration.nix
        home-manager.darwinModules.home-manager
        {
          # Let Determinate Nix handle Nix configuration
          nix.enable = false;

          # Enable touch ID for sudo
          security.pam.services.sudo_local.touchIdAuth = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
