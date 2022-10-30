{ lib, stdenvNoCC, fetchurl, ant, jdk, hostname, makeWrapper }:

stdenvNoCC.mkDerivation rec {
  pname = "abcl";
  version = "1.9.0";
  
  src = fetchurl {
    url = "https://abcl.org/releases/${version}/abcl-src-${version}.tar.gz";
    sha256 = "sha256-oStchPKINL2Yjjra4K0q1MxsRR2eRPPAhT0AcVjBmGk=";
  };
  
  buildInputs = [ ant jdk hostname makeWrapper ];

  modules = import ./jdk-modules.nix;

  openFlags = map (x: "--add-opens=java.base/${x}=ALL-UNNAMED") modules;

  buildPhase = ''
    ant \
      -Djava.options="${lib.concatStringsSep " " openFlags}" \
      -Dabcl.runtime.jar.path="$out/share/java/abcl.jar" \
      -Dadditional.jars="$out/share/java/abcl-contrib.jar"
  '';

  patches = [
    ./patches/abcl-fix-runtime-class-annotations.patch
    ./patches/abcl-fix-gray-stream-element-type-binary.patch
  ];
  
  javaOpts = [
    "\$JAVA_OPTS"
    "--add-opens=java.base=ALL"
    (lib.optionalString
      (lib.versionAtLeast jdk.version "17")
      "--add-opens=java.base/java.util.jar=ALL-UNNAMED")
  ];

  installPhase = ''
    mkdir -pv $out/share/java
    mkdir -pv $out/bin
    cp -r dist/*.jar $out/share/java
    cp abcl $out/bin
  '';
}