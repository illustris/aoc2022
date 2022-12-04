{ stdenv, cmake, ... }:
stdenv.mkDerivation {
	pname = "s02-c";
	version = "1.0";
	src = ./.;
	nativeBuildInputs = [ cmake ];
}

