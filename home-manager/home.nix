# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../packages
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jont";
    homeDirectory = "/home/jont";

    file = {
      ".config/zsh" = {
        source = ./../dotfiles/zsh;
        recursive = true;
      };

      ".gitconfig" = {
        text = ''
          [user]
            email = townsend.jonathan.e@gmail.com
            name = jon-edward

          [core]
            sshCommand = "ssh -i ~/.ssh/gh_jon-edward"

          [url "git@github.com:"]
            insteadOf = "https://github.com/"
          
          [includeIf "gitdir/i:~/aimless-wiki/"]
            path = ~/.aimless-wiki.gitconfig
        '';
      };

      ".aimless-wiki.gitconfig" = {
        source = ./../dotfiles/.aimless-wiki.gitconfig;
      };

      "aimless-wiki/.keep".text = "# This file is here to make sure its parent directory is created.";
      "jon-edward/.keep".text = "# This file is here to make sure its parent directory is created.";
    };
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
