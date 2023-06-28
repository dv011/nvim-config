-- netrw :Ex command to exit file
vim.keymap.set("n", "<leader>jf", vim.cmd.Ex)

-- move text in visual mode up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- start a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- keeps cursor in middle of page while jumping up and down and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy to clipboard, leader y to yank to system keyboard, leader Y yanks the current line
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- opens new window to the righthand side
vim.keymap.set("n", "<leader>nv", ":rightbelow vnew,<CR>", { noremap = true })

-- saves file
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true })

-- saves and source file
vim.keymap.set("n", "<leader>S", ":w<CR>:so<CR>", { noremap = true })

-- save file and make it executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quickfix list navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- add keymap to quit
