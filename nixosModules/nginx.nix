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
        recommendedTlsSettings = true;
        virtualHosts = {
          wrlx = {
            default = true;
            enableACME = true;
            forceSSL = true;
            root = (
              builtins.fetchTarball {
                url = "https://storage.mynixos.com/401/resources/635cf7cf-7eda-492e-89ae-a06d4dfb5bdd/site.tar.gz";
                sha256 = "+NErJxvUWRknhf82HDT/lso+jee99hM6KfgVtGL6VXY=";
              }
            );
            serverName = "hashwarlock.dev";
          };
        };
      };
    };
  };
}
