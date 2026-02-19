return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'
    vim.opt.conceallevel = 1
  end
}
