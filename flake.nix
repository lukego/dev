{

  description = "Development environment";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.outputs.legacyPackages.${system};
    in {
      packages.${system} = rec {
        clojure = pkgs.callPackage ./clojure.nix { inherit ant; };
        sbcl = pkgs.callPackage ./sbcl.nix {};
        emacs = pkgs.callPackage ./emacs.nix {};
        ant = pkgs.callPackage ./ant.nix {};
      };
    };

}
  
