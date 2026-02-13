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

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
  }: let
    # Use a function to set the home manager config per user depending on the
    # username. This can eventually be refactored into a seperate home.nix per user
    # that mostly imports a common one.
    mkHome = username: {
      home-manager.users.${username} = import ./home/home.nix;

      # Automatically append old files to be replaced with .before-home-manager
      home-manager.backupFileExtension = "before-home-manager";
    };

    mkDarwinSystem = username: hostModule:
      nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          hostModule
          home-manager.darwinModules.home-manager
          (mkHome username)
          {
            # Set Git commit hash for darwin-version. The self property is only
            # available here, so just plonk this here for now.
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }
        ];
      };
  in {
    darwinConfigurations = {
      "842f57432ec3" = mkDarwinSystem "alasflyn" ./modules/hosts/aws.nix; # AWS
      "GC9VDX0C4R" = mkDarwinSystem "alasflyn" ./modules/hosts/s1.nix; # S1
    };
  };
}
