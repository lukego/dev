{

  description = "Development environment";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.outputs.legacyPackages.${system};
    in {
      packages.${system} = rec {
        jdk = pkgs.jdk17;
        clojure = pkgs.callPackage ./clojure.nix { inherit jdk ant; };
        sbcl = pkgs.callPackage ./sbcl.nix {};
        emacs = pkgs.callPackage ./emacs.nix {};
        ant = pkgs.callPackage ./ant.nix { inherit jdk; };
        fd = pkgs.callPackage ./fd.nix {};
        sqlite = pkgs.callPackage ./sqlite.nix {};
      };
    };

}
  
