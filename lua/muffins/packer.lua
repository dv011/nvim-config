-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({ 'cocopon/iceberg.vim', as = 'iceberg' })

  use ({ 'rose-pine/neovim', as = 'rose-pine' })

  use ('tylerbrazier/vim-bracepair')

  use ('tpope/vim-commentary')

  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/playground'

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- bequired
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'hrsh7th/cmp-buffer'},   -- Not Required, Added this myself
	  {'hrsh7th/cmp-path'},     -- Not Required, Added this myself
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}

-- debuggers, daps
use 'mfussenegger/nvim-dap'
use 'leoluz/nvim-dap-go'
use 'rcarriga/nvim-dap-ui'
use 'theHamsta/nvim-dap-virtual-text'
use 'jay-babu/mason-nvim-dap.nvim'
use 'mfussenegger/nvim-jdtls'

use ('jbyuki/instant.nvim')

-- formatter
use 'jose-elias-alvarez/null-ls.nvim'

end)
