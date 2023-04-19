function ColorMyIDE(color)
	if color == 'dawn' then
		vim.g.rose_pine_variant = 'dawn'
	else
		vim.g.rose_pine_variant = 'moon'
	end
	print(vim.g.rose_pine_variant)
	vim.cmd('colorscheme rose-pine-' .. vim.g.rose_pine_variant)
end

vim.api.nvim_set_keymap('n', '<leader>cc', ':lua ColorMyIDE()<CR>', { noremap = true })
