{ lib, stdenv, fetchFromGitHub, qmake, qtbase, pkg-config, sigutils, fftwSinglePrec, suwidgets, wrapQtAppsHook, suscan, libsndfile, soapysdr, libxml2, volk }:

stdenv.mkDerivation rec {
  pname = "sigdigger";
  version = "e93770dcef7c934683a18b4ed07ccdf33f41c3ce";

  src = fetchFromGitHub {
    owner = "BatchDrake";
    repo = "SigDigger";
    rev = "${version}";
    sha256 = "sha256-OWFPf1iIDhzgV7+pANp7lxzEBhxND0tIhB0VGNOeCak=";
  };

  nativeBuildInputs = [
    qmake
    pkg-config
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    sigutils
    fftwSinglePrec
    suwidgets
    suscan
    libsndfile
    libxml2
    volk
    soapysdr
  ];

  qmakeFlags = [
    "SUWIDGETS_PREFIX=${suwidgets}"
    "SigDigger.pro"
  ];

  meta = with lib; {
    description = "Qt-based digital signal analyzer, using Suscan core and Sigutils DSP library";
    homepage = "https://github.com/BatchDrake/SigDigger";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [ polygon ];
  };
}
