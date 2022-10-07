{ pkgs, stdenv, zstd, texinfo, fetchurl, ... }:

stdenv.mkDerivation rec {

  pname = "sbcl";

  version = "2.2.9";

  buildInputs = let
    zstd' = zstd.override { static = true; };
  in [
    zstd'
    zstd'.dev
    texinfo
  ];

  src = fetchurl {
    url = "mirror://sourceforge/project/sbcl/sbcl/${version}/sbcl-${version}-source.tar.bz2";
    hash = "sha256-fr69bSAj//cHewNy+hFx+IBSm97GEE8gmDKXwv63wXI=";
  };

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
