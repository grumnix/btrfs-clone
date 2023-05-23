{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonPackages = pkgs.python3Packages;
      in {
        packages = rec {
          default = btrfs-clone;

          btrfs-clone = pythonPackages.buildPythonPackage rec {
            pname = "btrfs-clone";
            version = "0.0.0";

            src = ./.;
          };
        };
      }
    );
}
