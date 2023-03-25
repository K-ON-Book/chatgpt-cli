{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      perSystem = { config, pkgs, system, ... }: {
        packages.default = pkgs.callPackage ./build.nix { };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ config.packages.default ];
          buildInputs = with pkgs; [
            pkg-config
          ];
        };
      };
    };
}
