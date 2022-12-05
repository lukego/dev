{

  description = "Development environment";

  inputs.nixpkgs.url = "github:lukego/nixpkgs/shaderc-2022.4";
  inputs.nix.url = "nix/2.11.1";
  inputs.nix-clj.url = "github:uthar/nix-clj";

  outputs = { self, flake-utils, nixpkgs, nix, nix-clj }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.outputs.legacyPackages.${system};
      nix-pkg = nix.packages.${system}.default;
      cljpkgs = nix-clj.packages.${system};
    in {
      packages = rec {
        jdk = pkgs.jdk17;
        clojure = pkgs.callPackage ./clojure.nix { inherit jdk ant; };
        cider = pkgs.callPackage ./cider.nix { inherit cljpkgs; };
        sbcl = pkgs.callPackage ./sbcl.nix {};
        emacs = pkgs.callPackage ./emacs.nix { inherit sqlite; };
        ant = pkgs.callPackage ./ant.nix { inherit jdk; };
        fd = pkgs.callPackage ./fd.nix {};
        sqlite = pkgs.callPackage ./sqlite.nix {};
        fossil = pkgs.callPackage ./fossil.nix { inherit sqlite; };
        clasp = pkgs.callPackage ./clasp.nix {};
        abcl = pkgs.callPackage ./abcl.nix { inherit jdk ant; };
        openssl_1_0_0 = pkgs.callPackage ./openssl_1_0_0.nix {};
        nix = pkgs.callPackage ./nix.nix { nix = nix-pkg; };
      };
    });

}
