{

  description = "Development environment";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.outputs.legacyPackages.${system};
    in {
      packages.${system} = {
        clojure = import ./clojure.nix { inherit pkgs; };
      };
    };

}
  
