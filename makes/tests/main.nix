{__nixpkgs__, ...}: let
  pkgs = __nixpkgs__;
in
  pkgs.stdenv.mkDerivation {
    name = "Hello-std-makes-test";
    src = ../../.;
    nativeBuildInputs = [pkgs.zig.hook];
    doCheck = true;

    checkPhase = ''
      runHook preCheck
      zig build test --summary all
      runHook postCheck
    '';
  }
