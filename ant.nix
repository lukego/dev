{ pkgs, jdk, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  pname = "ant";
  version = "1.10.12";

  src = fetchFromGitHub {
    owner = "apache";
    repo = "ant";
    rev = "rel/${version}";
    sha256 = "1gb1bd3b6lqfap1904q4lcrbmrzb87v306a72n13vglncpfgcl6m";
  };

  buildInputs = [ jdk ];

  buildPhase = ''
    mkdir $out
    sh build.sh -Dant.install=$out install-lite
  '';

  dontInstall = true;

}
