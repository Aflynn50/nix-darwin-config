{ pkgs, ... }:
{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;

  plugins = with pkgs.vimPlugins; [
    vim-go
    vim-fugitive
    idris2-vim
    vim-airline
    vim-airline-themes
    vim-markdown
    vim-abolish
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    vim-cool
    # (nvim-treesitter.withPlugins (p: [ p.nix p.go p.rust p.lua ]))
    nvim-treesitter.withAllGrammars
    nvim-lspconfig
    rust-vim

    # My custom NeoSolarized 
    (pkgs.vimUtils.buildVimPlugin {
      name = "neosolarized-custom";
      src = pkgs.fetchFromGitHub {
        owner = "Aflynn50";
        repo = "NeoSolarized";
        rev = "main";
        sha256 = "0000000000000000000000000000000000000000000000000000";
      };
    })
  ];

  extraConfig = ./init.vim;
  extraLuaConfig = ./init.lua;
}
