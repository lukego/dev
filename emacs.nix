{ pkgs, fetchFromSavannah, sqlite, ... }:

let

  emacs = pkgs.emacs.override {
    inherit sqlite;
    withGTK3 = true;
    withSQLite3 = true;
    nativeComp = false; # Takes too long
  };

in emacs.overrideAttrs (o: {

  # Recent tip of trunk
  src = fetchFromSavannah {
    repo = "emacs";
    rev = "d04433b96215d7d3387573f19cc315de86f2341a";
    sha256 = "sha256-1hCmQPKIdhV3oDH1NWP2K6uOYIOofBqy04cPkzfSxNM=";
  };

  version = "29.0.50";

})
