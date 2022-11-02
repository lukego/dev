{ lib, stdenv
, installShellFiles
, tcl
, libiconv
, fetchurl
, fetchpatch
, zlib
, openssl
, readline
, ed
, which
, tcllib
, sqlite
}:

stdenv.mkDerivation rec {
  pname = "fossil";
  version = "2.19";

  src = let
    rev = "834db57d95f6e16d56eb39312145f448769b47fde2964ffa5d593063fe478b1e";
  in fetchurl {
    url = "https://www.fossil-scm.org/home/tarball/${rev}/fossil-${rev}.tar.gz";
    sha256 = "sha256-wd6T75QwqYFttlhsStfUDKDBM2T0Rdfi64MgOQt0aQE";
  };

  configureFlags = [
    "--disable-internal-sqlite"
    "--json"
  ];

  patchFlags = [
    "-p0"
  ];

  patches = [
    # Adds region history
    (fetchpatch {
      url = "https://fossil.galkowski.xyz/fossil/vpatch?from=a248ace5e7c89b1c&to=7c2bb7a2b05e504e";
      sha256 = "sha256-P2LWKreZjRbRimXRgNIweCOIMwCduHLp4RxyQNp99+g";
    })
  ];

  nativeBuildInputs = [ installShellFiles tcl tcllib ];

  buildInputs = [ sqlite zlib openssl readline which ed ];

  enableParallelBuilding = true;

  preBuild = ''
    export USER=nonexistent-but-specified-user
  '';

  installPhase = ''
    mkdir -p $out/bin
    INSTALLDIR=$out/bin make install

    installManPage fossil.1
    installShellCompletion --name fossil.bash tools/fossil-autocomplete.bash
  '';

}
