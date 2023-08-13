{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        pythonPackages = ps: with ps; [ pybind11 numpy ];
      in
        with pkgs;
        {
          devShells.default = mkShell {
            shellHook = ''
'';
            nativeBuildInputs = [
              cmake
              zeromq
              sqlite
              gtest

              (python3.withPackages pythonPackages)

              clang-tools_16
            ];
          };
        }
    );
}
