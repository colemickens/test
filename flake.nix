{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: {
    packages.x86_64-linux.default =
      let
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      in
        pkgs.runCommand "random" {} ''
          echo "$RANDOM $RANDOM $RANDOM" > $out
        '';
  };
}
