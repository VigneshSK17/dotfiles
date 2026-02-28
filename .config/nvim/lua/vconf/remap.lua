-- Navigation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace every instance of word in file
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = false })

-- Files
vim.keymap.set('n', '<leader>W', ':silent w !sudo tee % > /dev/null | :edit!<CR>', { noremap = true, silent = false }) -- save with root

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
