with import <nixpkgs> {};
llvmPackages.libcxxStdenv.mkDerivation {
  name = "nim-nix-shell";

  nativeBuildInputs = [
    llvmPackages.libcxxClang
    libgcc
  ];

  buildInputs = [
    cmake
    pkg-config
    emscripten
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi.dev
    wayland-scanner
    openssl
    alsa-lib
    mesa
    glfw
    glm
    gcc
  ];
  
  shellHook = ''
    export PATH=$PATH:~/.nimble/bin
  '';
}