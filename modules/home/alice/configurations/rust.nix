{
  flake.custom.alice.rust = {
    pkgs,
    lib,
    ...
  }: {
    home.file.".cargo/config.toml".text = ''
      [env]
      OPENSSL_LIB_DIR = "${lib.getLib pkgs.openssl}/lib"
      OPENSSL_INCLUDE_DIR = "${lib.getDev pkgs.openssl}/include"
      PKG_CONFIG_PATH = "${lib.getDev pkgs.openssl}/lib/pkgconfig"
    '';
  };
}
