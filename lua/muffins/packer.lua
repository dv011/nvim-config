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
	  -- {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  -- {'hrsh7th/cmp-buffer'},   -- Not Required, Added this myself
	  -- {'hrsh7th/cmp-path'},     -- Not Required, Added this myself
	  -- {'L3MON4D3/LuaSnip'},     -- Required
  }
}

-- cmp-plugins
use {
    'hrsh7th/nvim-cmp',
    config = function ()
        require'cmp'.setup {
            snippet = {
                expand = function(args)
                    require'luasnip'.lsp_expand(args.body)
                end
            },

            sources = {
                { name = 'luasnip' },
                -- more sources
            },
        }
    end
}
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'


-- snippets
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
use 'rafamadriz/friendly-snippets'

-- Installation
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

-- terminal
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}

use 'ThePrimeagen/vim-be-good'

use 'thanthese/Tortoise-Typing'

end)
