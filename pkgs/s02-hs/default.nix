{ pkgs, ... }:
pkgs.haskellPackages.developPackage {
	root = ./.;
	modifier = drv: pkgs.haskell.lib.addExtraLibraries drv (with pkgs.haskellPackages; [
		split
	]);
}

