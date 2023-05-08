{
  description = "Welcome to hashwarlock's dev website";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixos-generators, ... }@inputs:
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
