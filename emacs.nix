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
    rev = "277504584d4cf7b3d67cd4a8cae1849b6cc700fc";
    hash = "sha256-dyLZ/mP7tt++isX969NbT3PDj4YMned782/9btZCjHA=";
  };

  version = "29.0.50";

})
