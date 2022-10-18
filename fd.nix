{ pkgs, rustPlatform, fetchFromGitHub, ... }:

rustPlatform.buildRustPackage rec {
  pname = "fd";
  version = "8.4.0";

  src = fetchFromGitHub {
    owner = "uthar";
    repo = "fd";
    rev = "c40968298070a6397abcd0bba95a94f06b8d70ac";
    sha256 = "0a92b2szif7qfsb5bj57bx544hzf8nyb6qgqmh34aip2z75j5hpv";
  };

  cargoSha256 = "1r7pcigfd5zjgh3f2yab4skrqvk8l3asrhxj34yy5v7v8j7hlmsp";

}
