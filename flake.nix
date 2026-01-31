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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
      mkHome = username: {
        home-manager.users.${username} = import ./home/home.nix;
      };
    in  {
    darwinConfigurations = {
	"842f57432ec3" = nix-darwin.lib.darwinSystem { # Aws mac
	      modules = [ 
		./configuration.nix
		./modules/hosts/aws.nix
		home-manager.darwinModules.home-manager
		(mkHome "alaflyn")
		{
		  # Set Git commit hash for darwin-version.
		  system.configurationRevision = self.rev or self.dirtyRev or null;
		}
	      ];

	};
	"GC9VDX0C4R" = nix-darwin.lib.darwinSystem { # S1 mac
	      modules = [ 
		./configuration.nix
		./modules/hosts/s1.nix
		home-manager.darwinModules.home-manager
		(mkHome "alastai.flynn")
		{
		  # Set Git commit hash for darwin-version.
		  system.configurationRevision = self.rev or self.dirtyRev or null;
		}
	   ];
	};
      };
  };
}
