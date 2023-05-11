{
  description = "Welcome to hashwarlock's dev website";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-generators, flake-utils, ... }@inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      nixosModules = {
        nginx = import ./nixosModules/nginx.nix flakeContext;
        system = import ./nixosModules/system.nix flakeContext;
      };
      packages = {
        x86_64-linux = {
          nixos = import ./packages/nixos.nix flakeContext;
        };
      };
    };
}
