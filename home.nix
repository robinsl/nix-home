{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "robin";
    homeDirectory = "/home/robin";
    stateVersion = "24.05";

    packages = with pkgs; [
      neofetch
      vscode
      fzf
      kitty-themes
      (pkgs.nerdfonts.override {
        fonts = [ "Hack" "DroidSansMono" ];
      })
    ];

    file."./.config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };

    file."./.config/alacritty/alacritty.toml" = {
      source = ./alacritty.toml;
    };

    file."./.config/kitty/kitty.conf" = {
      source = ./kitty.conf;
    };

  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      rehome = "home-manager switch";
    };

  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      #LSP
      lua-language-server
      gopls

      #Formater
      stylua
      nixpkgs-fmt
    ];
    plugins = with pkgs.vimPlugins; [
      dracula-vim
      oil-nvim
    ];
  };
}
