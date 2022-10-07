{

  description = "Development environment";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.outputs.legacyPackages.${system};
    in {
      packages.${system} = {
        clojure = pkgs.callPackage ./clojure.nix {};
        sbcl = pkgs.callPackage ./sbcl.nix {};
      };
    };

}
  
