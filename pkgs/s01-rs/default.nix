{ rustPlatform, ... }:
rustPlatform.buildRustPackage {
	pname = "s01-rs";
	version = "1.0";
	cargoLock.lockFile = ./Cargo.lock;
	src = ./.;
}
