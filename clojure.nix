{ pkgs }:
let
  jdk = pkgs.jdk17;
  clojure = pkgs.clojure.override { inherit jdk; };
in clojure
