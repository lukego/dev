{ cljpkgs, ... }:
let

  cider = cljpkgs.clojure.buildUberjar "cider" [
    cljpkgs.clojure.pkgs.ciderNrepl
  ];

in cider
