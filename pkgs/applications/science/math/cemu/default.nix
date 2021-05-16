{ fetchFromGitHub
, lib
, mkDerivation
, SDL2
, libGL
, libarchive
, libusb-compat-0_1
, qtbase
, qmake
, git
, libpng_apng
, pkg-config
}:

mkDerivation rec {
  pname = "CEmu";
  version = "dfa1dc46e6f236a0a3d42feba7f7e105348de40b";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "CEmu";
    rev = "${version}";
    sha256 = "sha256-WzBRgQejOfzEwYJhKIgs7IvE0bHiaM1YaF3dGbd5Rvc=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    qmake
    git
    pkg-config
  ];

  buildInputs = [
    SDL2
    libGL
    libarchive
    libusb-compat-0_1
    qtbase
    libpng_apng
  ];

  qmakeFlags = [
    "gui/qt"
  ];

  meta = with lib; {
    changelog = "https://github.com/CE-Programming/CEmu/releases/tag/v${version}";
    description = "Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features";
    homepage = "https://ce-programming.github.io/CEmu";
    license = licenses.gpl3;
    maintainers = with maintainers; [ luc65r ];
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };
}
