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
    rev = "f61db42fc580fb671016c77be942506d9081ac2c";
    sha256 = "0n25hzxv72kfavqpifhdpqchx398mqzvpiypdrbfyc8k66jxl2f9";
  };

  version = "29.0.50";

})
