{
  description = "A simple flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        devPackages = with nixpkgs; [
          pkgs.nodejs
        ];

        shellHook = "";
      in
      {

        devShells = {
          default = pkgs.mkShell {
            name = "dev-shell";
            packages = devPackages;
            shellHook = shellHook;
          };
        };
      }
    );
}
