{ pkgs, ... }:

{
  # Rust 工具链配置
  languages.rust = {
    enable = true;
    channel = "stable";
  };

  # 系统依赖包
  packages = [
    pkgs.pkg-config
    pkgs.openssl
    pkgs.cmake
    pkgs.llvmPackages.clang
    pkgs.llvmPackages.libclang.lib
  ];

  # 环境变量
  env.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  env.LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

  # Shell 初始化脚本
  enterShell = ''
    export CC=clang  
    export CXX=clang++  
      
    echo "🦀 Rust 开发环境已准备就绪"  
    rustc --version  
    cargo --version  
  '';
}
