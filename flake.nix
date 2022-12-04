{
	description = "Advent of code 2022";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		illustris = {
			url = "github:illustris/flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, illustris, ... }: with self.lib; rec {
		lib = import ./lib { lib = nixpkgs.lib // illustris.lib; };

		packages = genAttrs [
			"x86_64-linux"
			"aarch64-linux"
		] (system: let
			pkgs = import nixpkgs {
				inherit system;
				overlays = [(_: _: {inherit lib;})];
			};
		in (import ./pkgs {inherit pkgs lib system;}) // (with scriptBuilder { inherit pkgs; debug = true; }; {
			newq = mkScript "newq" (scriptBody [
				# make package dirs
				"touch inputs/$1.txt"
				"mkdir -p pkgs/s$1-{c,hs,rs}"
				# set up C
				(writeFile "pkgs/s$1-c/CMakeLists.txt" (indent ''
					project(s$1-c)
					add_executable(s$1-c main.c)
					install(PROGRAMS \''${CMAKE_BINARY_DIR}/s$1-c DESTINATION bin)
				''))
				(writeFile "pkgs/s$1-c/main.c" (indent ''
					int main () {
						printf(\"Hello world\\n\");
					}
				''))
				(writeFile "pkgs/s$1-c/default.nix" (indent ''
					{ stdenv, cmake, ... }:
					stdenv.mkDerivation {
						pname = \"s$1-c\";
						version = \"1.0\";
						src = ./.;
						nativeBuildInputs = [ cmake ];
					}
				''))
				# Set up Hs
				(writeFile "pkgs/s$1-hs/default.nix" (indent ''
					{ pkgs, ... }:
					pkgs.haskellPackages.developPackage {
						root = ./.;
						modifier = drv: pkgs.haskell.lib.addExtraLibraries drv (with pkgs.haskellPackages; [
						]);
					}
				''))
				(writeFile "pkgs/s$1-hs/s$1-hs.cabal" (indent ''
					name: s$1-hs
					version: 1.0
					executable s$1-hs
						main-is: Main.hs
						build-depends:
							base
				''))
				(writeFile "pkgs/s$1-hs/Main.hs" (indent ''
					module Main where
					main :: IO ()
					main = do
						putStrLn \"Hello world\"
				''))
				# Set up Rs
				(writeFile "pkgs/s$1-rs/default.nix" (indent ''
					{ rustPlatform, ... }:
					rustPlatform.buildRustPackage {
						pname = \"s$1-rs\";
						version = \"1.0\";
						cargoLock.lockFile = ./Cargo.lock;
						src = ./.;
					}
				''))
				(writeFile "pkgs/s$1-rs/main.rs" (indent ''
					fn main() {
						println!(\"Hello world\");
					}
				''))
				"pushd pkgs/s$1-rs"
				(nixShell [ "${nixpkgs}#rustc" "${nixpkgs}#cargo" ] "cargo init && cargo update || true" )
				"popd"
			]);
		}));
	};
}
