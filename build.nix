{ rustPlatform
, pkg-config
, stdenv
, openssl
, glib
}:

rustPlatform.buildRustPackage rec {
  pname = "chatgpt-cli";
  version = "0.1.0";

  src = ./.;
  cargoLock = {
    lockFile = ./Cargo.lock;
  };
  nativeBuildInputs = [
    pkg-config
    openssl
  ];

  buildInputs = [
  ];

}
