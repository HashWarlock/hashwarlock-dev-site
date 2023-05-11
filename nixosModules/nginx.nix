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
    systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
    services = {
      nginx = {
        enable = true;
        recommendedTlsSettings = true;
        recommendedOptimisation = true;
        recommendedGzipSettings = true;
        virtualHosts."hashwarlock.dev" = {
          default = true;
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            recommendedProxySettings = true;
            proxyPass = "http://127.0.0.1:3000/";
            root = "/var/www/hashwarlock.dev";
          };

          serverName = "hashwarlock.dev";
        };
      };
    };
  };
}
