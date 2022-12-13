{
  description = "OSPF MANET Designated Routers implementation (RFCs 5614, 5243, 5838) ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit self;} {
      imports = [
        ./nix/overlays.nix
        ./nix/package/default.nix
      ];
      systems = ["x86_64-linux" "aarch64-linux"];
      perSystem = {inputs', ...}: {
        formatter = inputs'.nixpkgs.legacyPackages.alejandra;
      };
    };
}
