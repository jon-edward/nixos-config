with import <nixpkgs> {};
llvmPackages.libcxxStdenv.mkDerivation {
  name = "latex-nix-shell";

  buildInputs = [
    texliveFull
  ];
}