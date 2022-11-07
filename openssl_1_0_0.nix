{ pkgs, lib, stdenv, ... }:

stdenv.mkDerivation rec {
  pname = "openssl";
  version = "1.0.1u";

  nativeBuildInputs = [
    pkgs.perl
  ];

  configureFlags = [
    "shared --libdir=lib"
  ];

  configureScript = "./config";
  
  src = pkgs.fetchzip {
    url = "https://www.openssl.org/source/old/1.0.1/openssl-${version}.tar.gz";
    hash = "sha256-bSTC6Gj9Sfo2ho6NycieQNsDDeTzXMwVsbqEqvz4sQM=";
  };

  installTargets = [
    "install_sw"
  ];

}
