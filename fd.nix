{ pkgs, rustPlatform, fetchFromGitHub, ... }:

rustPlatform.buildRustPackage rec {
  pname = "fd";
  version = "8.5.1-kaspi";

  src = fetchFromGitHub {
    owner = "uthar";
    repo = "fd";
    rev = "731a1361e7eb55d4dbc76e549ca611d29ca521f3";
    sha256 = "sha256-Pzox4TJubWQL4Ew8NazsgTYgSv0bR3akUNcexKAEXVw";
  };

  cargoSha256 = "sha256-dhmpc3HYHRLO3r37m/vWkX77Xe7oiwYCqBTnNFx5Mlo";

}
