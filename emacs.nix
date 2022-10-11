{ pkgs, fetchFromSavannah, ... }:

let

  emacs = pkgs.emacs.override {
    withSQLite3 = true;
    nativeComp = false; # Takes too long
  };

in emacs.overrideAttrs (o: {

  # Recent tip of trunk
  src = fetchFromSavannah {
    repo = "emacs";
    rev = "59df0a7bd9e54003108c938519d64f6607cf48d8";
    sha256 = "0dglq9842g702hrzmn58kgnjkpzc4kp4c1avjlvni952vzrcnm47";
  };

  version = "29.0.50";

})
