{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = inputs@{ ... }: {
    nixosConfigurations = {
      my-system = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [{
          services.sshd.enable = true;
          networking.hostName = "my-system";
          boot.loader.systemd-boot.enable = true;
          fileSystems."/".device = "/dev/disk/by-label/nixos";
        }];
      };
    };
  };
}
