{
  description = "a flake to build `st` (simple terminal) with some patches";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        apps.st = flake-utils.lib.mkApp { drv = packages.st; };
        defaultApp = apps.st;
        defaultPackage = packages.st;
        packages = flake-utils.lib.flattenTree {
          st = pkgs.stdenv.mkDerivation {
            name = "st";
            buildInputs = with pkgs; [ pkg-config fontconfig ncurses freetype x11 ];
            src = self;
            buildPhase = "make clean all";
            installPhase = "TERMINFO=$out/share/terminfo make install PREFIX=$out";
          };
        };
      }
    );
}
