{ pkgs, fetchFromSavannah, sqlite, ... }:

let

  emacs = pkgs.emacs.override {
    inherit sqlite;
    # withGTK3 = true;
    withSQLite3 = true;
    nativeComp = false; # Takes too long
  };

in emacs.overrideAttrs (o: {

  # Recent tip of trunk
  src = fetchFromSavannah {
    repo = "emacs";
    rev = "39e0c60176242a2ca09f65090bcf2751b346ed26";
    hash = "sha256-M3Pf3AicylpqkQrUGLPsrLA+Gim8WoErpWxb/xUewkQ=";
  };

  version = "29.0.50";

})
