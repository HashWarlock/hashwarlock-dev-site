{
  description = "Welcome to hashwarlock's dev website";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "flake:nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs:
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
          wrlx = import ./packages/wrlx.nix flakeContext;
        };
      };
    };
}
