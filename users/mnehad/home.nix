{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mnehad";
  home.homeDirectory = "/home/mnehad";
  
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
      wget
      neofetch
      neovim
      vscodium
      cargo
      clang-tools_9
      efibootmgr
      elinks
      flatpak
      gcc
      gimp
      git
      github-desktop
      gnome.gnome-keyring
      gnugrep
      gnumake
      gparted
      gnugrep
      grub2
      kitty
      openssl
      nerdfonts
      qemu
      steam
      steam-run
      terminus-nerdfont
      tldr
      trash-cli
      unzip
      vlc
    firefox emacs 
    htop curl gzip zip 
    pass 
    sqlitebrowser 
    calibre 
    libreoffice 
    qbittorrent
    audacity 
    thunderbird 
    discord
    yakuake
    zsh
    thefuck
    nodejs_18
    kdeconnect
    chromium
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim="nvim";
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mnehad/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Vscode
  programs.vscode = {
  enable = true;
  package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      esbenp.prettier-vscode
      github.copilot-chat
      ms-azuretools.vscode-docker
      bradlc.vscode-tailwindcss
      github.vscode-pull-request-github
      prisma.prisma
      eamodio.gitlens
      mhutchie.git-graph
      streetsidesoftware.code-spell-checker
#      codium.codium
    ];
  };
  
  services.mpris-proxy.enable = true;


}