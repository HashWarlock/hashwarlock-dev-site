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
          password = "root";
        };
      };
    };
  };
}
