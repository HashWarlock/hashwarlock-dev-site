{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    security = {
      acme = {
        acceptTerms = true;
        defaults = {
          email = "bitsbender@protonmail.com";
        };
      };
    };
    services = {
      nginx = {
        enable = true;
        virtualHosts = {
          wrlx = {
            default = true;
            enableACME = true;
            forceSSL = true;
            root = "/data/webserver/terminal";
            serverName = "hashwarlock.dev";
          };
        };
      };
    };
  };
}
