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
    rev = "87301f262357c8003fe1a02b58bfcc9dc9d82a14";
    sha256 = "0gb8vklr2v1w2vxjc5zqvpi1qqz9jixi9s8nyb4qwd49rcvmpjs6";
  };

  version = "29.0.50";

})
