{
  inputs,
  lib,
  self,
  config,
  ...
}: {
  flake = {
    overlays.default = final: prev: {
      ospf-mdr = config.packages.ospf-mdr;
    };
  };
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    system,
    ...
  }: let
    pkgs = import inputs.nixpkgs {
      inherit system;

      overlays = [
        self.overlays.default
      ];
    };
  in {config = {_module.args.pkgs = pkgs;};};
}
