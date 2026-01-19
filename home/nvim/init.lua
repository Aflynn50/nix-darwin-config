require('telescope').load_extension('fzf')

require('lspconfig')

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
