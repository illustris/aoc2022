{ rustPlatform, ... }:
rustPlatform.buildRustPackage {
	pname = "s02-rs";
	version = "1.0";
	cargoLock.lockFile = ./Cargo.lock;
	src = ./.;
}

