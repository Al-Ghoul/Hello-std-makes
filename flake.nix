{
  description = "Hello-std-makes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    std = {
      url = "github:divnix/std";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        devshell.url = "github:numtide/devshell";
        nixago.url = "github:nix-community/nixago";
      };
    };
    makes = {
      url = "github:fluidattacks/makes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        # Development Environments
        (nixago "configs")
        (devshells "shells")
      ];
    } {devShells = std.harvest inputs.self ["repo" "shells"];};
}
