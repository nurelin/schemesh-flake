{
  stdenv,
  fetchFromGitHub,
  lib,
  ncurses,
  chez,
  libuuid,
}:

stdenv.mkDerivation rec {
  pname = "schemesh";
  version = "0.7.5";

  src = fetchFromGitHub {
    owner = "cosmos72";
    repo = "schemesh";
    rev = "v${version}";
    sha256 = "sha256-V/w+ZmGlDb7tykgRuLLFBVzq/2GX+GSsVOX0A2JUc2Q=";
  };

  buildInputs = [ ncurses chez libuuid ];

  buildFlags = "prefix=${placeholder "out"}";
  installFlags = "prefix=${placeholder "out"}";
  meta = with lib; {
    description = "A Unix shell and Lisp REPL, fused together";

    longDescription = ''
    Schemesh is an interactive shell scriptable in Lisp.

    It is primarily intended as a user-friendly Unix login shell, replacing bash, zsh, pdksh etc.
    '';

    homepage = "https://github.com/cosmos72/schemesh";

    license = licenses.gpl2Plus;

    maintainers = [ ];
  };
}
