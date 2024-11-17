{
  description = "A flake to provide support for 04f3:0c00 ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self,nixpkgs, ... }@inputs: 
  let 
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosModules.elanmoc2 = import ./elanmoc2.nix;
  };
}
