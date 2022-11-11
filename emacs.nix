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
    rev = "be1745606354e8b34325bc9526c9bad9f7302cce";
    hash = "sha256-PdeTTih//qsgZDW1Tv3loD5TgbF5xcXaaaXnGXTjFeY";
  };

  version = "29.0.50";

})
