{ lib, mlt, python, buildPythonPackage, pythonOlder }:

buildPythonPackage rec {
  pname = "mlt-bindings";
  version = mlt.version;
  disabled = pythonOlder "3.7";

  src = "${mlt}/lib/python${python.sourceVersion.major}.${python.sourceVersion.minor}/site-packages";

  nativeBuildInputs = [ mlt ];

  doCheck = false;
  pythonImportsCheck = [ "mlt" ];

  meta = with lib; {
    description = "Open source multimedia framework, designed for television broadcasting";
    homepage = "https://www.mltframework.org";
    license = mlt.meta.license;
    maintainers = with maintainers; [ polygon ];
    platforms = platforms.linux;
  };
}
