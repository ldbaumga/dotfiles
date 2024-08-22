-- Make window navigation easier
vim.keymap.set("n", "<C><leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<C><leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<C><leader>k", ":wincmd h<CR>")
vim.keymap.set("n", "<C><leader>l", ":wincmd l<CR>")

-- Shortcut for :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moves text selected in visual mode up or down lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Appends next line to end of current line and keeps cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Jumps half a window down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Centers the search result in the pane, n next, N prev
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pastes over the selected text without overwriting the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Deletes selected text without overwriting the buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disables Q (Q reruns last recoreded macro)
-- vim.keymap.set("n", "Q", "<nop>")

-- Refreshes tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Sets a find and replace command for word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Changes the permisions to allow file to be executible
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
