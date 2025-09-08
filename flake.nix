{
	description = "raylib playground";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		utils.url = "github:numtide/flake-utils";
		nixpkgs-ddogfoodd.url = "github:ddogfoodd/nixpkgs/update-zls";
	};

	outputs = { self, nixpkgs, nixpkgs-ddogfoodd, utils }:
	utils.lib.eachDefaultSystem(system:
		let

			# build overlay for zls 15 from ddogfoodd
			overlay = final: prev: {
				inherit (nixpkgs-ddogfoodd.legacyPackages.${prev.system})
				zls;
			};
			pkgs = import nixpkgs {
				inherit system;
				overlays = [ overlay ];
			};

		in {
			devShells.default = pkgs.mkShell {
				buildInputs = [
					pkgs.zig_0_15
					pkgs.zls
					
					pkgs.raylib

					pkgs.wayland-scanner
					pkgs.libxkbcommon
					pkgs.xorg.libXrender
					pkgs.xorg.libXrandr
					pkgs.xorg.libXinerama
					pkgs.xorg.libXi
					pkgs.xorg.libXfixes
					pkgs.xorg.libXext
					pkgs.xorg.libXcursor

					pkgs.wayland
				];

				LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath ([
					pkgs.wayland
				]);
			};
		}
	);
}
