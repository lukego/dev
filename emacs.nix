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
    rev = "c3b64985aa6f61886a24974836635284c86478ef";
    hash = "sha256-7D71fUgxoC303/c9S6jzTbjXPoYdWrMV7JwNcty2Mww";
  };

  version = "29.0.50";

})
