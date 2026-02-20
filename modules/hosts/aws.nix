{pkgs, ...}: {
  users.users.alasflyn = {
    name = "alasflyn";
    home = "/Users/alasflyn";
    shell = pkgs.fish;
  };

  home-manager.users.alasflyn = {
    # This will append onto the zsh and fish config created in the common home manager nix files.
    programs.zsh.initContent = ''
      export PATH=$HOME/.toolbox/bin:$HOME/.guard/bin:$PATH
      eval "$(/opt/homebrew/bin/brew shellenv)"
      # Set up mise for runtime management
      eval "$(mise activate zsh)"
      source $HOME/.brazil_completion/zsh_completion

      . $HOME/workplace/Uluru/CloudsoftUluruHelpers/src/CloudsoftUluruHelpers/build/bin/install-uluru-scripts.sh --quiet --profile uluru
    '';
    programs.fish.interactiveShellInit = ''
      fish_add_path ~/.toolbox/bin/
      fish_add_path ~/.guard/bin/
      # bass source $HOME/workplace/Uluru/CloudsoftUluruHelpers/src/CloudsoftUluruHelpers/build/bin/install-uluru-scripts.sh --quiet --profile uluru
    '';
  };
}
