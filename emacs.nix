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
    rev = "1682bd18f50ed2095b2162207603c6b8a3f0225f";
    hash = "sha256-ZsH2hWkMV7/fDNrG6cE8rRudhHfNvJs+CbJnKMLnVMA";
  };

  version = "29.0.50";

})
