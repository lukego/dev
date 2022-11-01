{ pkgs, stdenv, zstd, texinfo, fetchurl, ... }:

stdenv.mkDerivation rec {

  pname = "sbcl";

  version = "2.2.10";

  buildInputs = let
    zstd' = zstd.override { static = true; };
  in [
    zstd'
    zstd'.dev
    texinfo
  ];

  src = fetchurl {
    url = "mirror://sourceforge/project/sbcl/sbcl/${version}/sbcl-${version}-source.tar.bz2";
    hash = "sha256-jMPDqHYSI63vFEqIcwsmdQg6Oyb6FV1wz5GruTXpCDM";
  };

  patches = [
    ./patches/sbcl-dont-cat.patch
  ];

  postPatch = ''
    echo '"${version}.kaspi"' > version.lisp-expr
  '';

  buildPhase = ''
    sh make.sh --prefix=$out --xc-host=${pkgs.sbclBootstrap}/bin/sbcl --fancy --without-sb-ldb
    (cd doc/manual && make info)
  '';

  installPhase = ''
    INSTALL_ROOT=$out sh install.sh
  '';

}
