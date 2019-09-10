with (import <nixpkgs> {});
let
  jekyll_env = bundlerEnv {
    name = "blog";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "blog";
  buildInputs = [jekyll_env ruby];

  src = ./.;

  phases = ["installPhase"];

  installPhase = ''
    mkdir -p $out
    jekyll build -s $src -b blog -d $out
  '';
}
