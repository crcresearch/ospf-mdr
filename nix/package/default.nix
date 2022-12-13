{lib, ...}: {
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    system,
    ...
  }: let
    pkg = pkgs.callPackage ./ospf-mdr/default.nix {};
  in {
    packages = {
      default = pkg;
      ospf-mdr = pkg;
    };

    devShells.default = pkg;
  };
}
