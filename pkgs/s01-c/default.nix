{ stdenv, cmake, ... }:
stdenv.mkDerivation {
	pname = "s01-c";
	version = "1.0";
	src = ./.;
	nativeBuildInputs = [ cmake ];
}
