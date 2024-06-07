{ config, pkgs, ... }:

let
  system = builtins.currentSystem;
  extensions =
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/nix-vscode-extensions";
      ref = "refs/heads/master";
      rev = "c43d9089df96cf8aca157762ed0e2ddca9fcd71e";
    })).extensions.${system};
  extensionsList = with extensions.open-vsx; [
    asvetliakov.vscode-neovim
    esbenp.prettier-vscode
    ms-azuretools.vscode-docker
    bradlc.vscode-tailwindcss
    github.vscode-pull-request-github
    prisma.prisma
    eamodio.gitlens
    mhutchie.git-graph
    streetsidesoftware.code-spell-checker
    codium.codium
    jnoortheen.nix-ide
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = extensionsList;
  };
}
