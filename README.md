## Add the flake to source 
```
{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
      elanmoc2.url = github:sandptel/elanmoc2";  
  };
  outputs = { self,nixpkgs,home-manager, ... }@inputs: 
  let 
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.roronoa = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self system inputs ;};
      modules = [
        inputs.elanmoc2.nixosModules.elanmoc2
      ];
    };
  };
}

```

## Enable the option from configuration.nix
```
services.fprintd.elanmoc2.enable=true;
```
