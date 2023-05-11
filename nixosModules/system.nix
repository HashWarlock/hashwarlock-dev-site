{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  imports = [
    inputs.self.nixosModules.nginx
  ];
  config = {
    networking = {
      firewall = {
        allowedTCPPorts = [
          22
          80
          443
        ];
      };
    };
    services = {
      openssh = {
        enable = true;
        passwordAuthentication = false;
      };
    };
    users = {
      users = {
        root = {
          openssh = {
            authorizedKeys = {
              keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ1kROv/ERg+Eun+eaOb4umjDmp7ORQREQFqF5r7QEQG hashwarlock@protonmail.com"
              ];
            };
          };
          hashedPassword = "$6$mRozIP8tgDqhvyGs$HY7tFM7T/0oaTcdt8abTdvFlPaI07ooFu7y1o7ZFpjHhHSCZNEKUj57Sv7wdYMGCjyilNGXZeMoLWYDp9Jhcg/";
        };
      };
    };
  };
}
