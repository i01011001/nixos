{pkgs}: 
# pkgs.writeShellScriptBin "sdsd" '' echo "hello world" | ${pkgs.cowsay}/bin/cowsay''
let
    cowsay = "${pkgs.cowsay}/bin/cowsay";
in
  pkgs.writeShellScriptBin "hello"  '' echo "hello world" | ${cowsay}''  
