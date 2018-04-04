# This file contains configuration for packages to install.
# It does not contain configuration for software that is already covered
# by other NixOS options (e.g. emacs)

{ config, pkgs, ... }:

let unstable = import <nixos-unstable> { config.allowUnfree = true; };
in {
  # Configure the Nix package manager
  nixpkgs = {
    config.allowUnfree = true;
    config.packageOverrides = oldPkgs: oldPkgs // {
      wallpapers = import ./pkgs/wallpapers.nix;
    };
  };

  # ... and declare packages to be installed.
  environment.systemPackages = with pkgs; [
    # Default nixos.* packages:
    alacritty
    curl
    direnv
    dnsutils
    exa
    fd
    firefox-bin
    fish
    gcc
    git
    gnome3.dconf
    gnome3.evolution
    gnome3.glib_networking
    gnumake
    gnupg
    google-cloud-sdk
    gopass
    htop
    i3lock
    iftop
    jetbrains.idea-ultimate
    jq
    kubernetes
    lispPackages.quicklisp
    lxappearance-gtk3
    manpages
    maven
    nixops
    numix-gtk-theme
    numix-icon-theme
    openjdk
    openssl
    openssl.dev
    pass
    pavucontrol
    pkgconfig
    qjackctl
    ripgrep
    rustracer
    sbcl
    spotify
    stdmanpages
    tdesktop
    terraform_0_10
    tig
    tmux
    tree
    unzip
    xclip
    xfce.xfce4-screenshooter

    # Haskell packages:
    cabal-install
    ghc
    hlint
    stack
    stack2nix
    haskellPackages.intero
    haskellPackages.stylish-haskell
    haskellPackages.yesod-bin

    # Unstable packages:
    unstable.numix-cursor-theme
    unstable.kontemplate
    unstable.mq-cli

    # Custom packages:
    (import pkgs/pulseaudio-ctl.nix)
  ];
}
