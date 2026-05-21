vim.g.mapleader = " "
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.diagnostic.config({ virtual_text = true })

-- theme
vim.pack.add({
    'https://github.com/scottmckendry/cyberdream.nvim.git',
    'https://github.com/navarasu/onedark.nvim',
    'https://github.com/catppuccin/nvim'
})
-- vim.cmd("colorscheme cyberdream")
require('onedark').setup{
    style = 'warmer'
}
require('onedark').load()
-- vim.cmd("colorscheme catppuccin")

-- auto pairs
vim.pack.add({
    'https://github.com/windwp/nvim-autopairs.git'
})
require("nvim-autopairs").setup{}

-- treesitter
vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter'
})
require'nvim-treesitter'.install{'cpp', 'c'}

-- lualine
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})
require('lualine').setup()

-- nvim-tree
vim.pack.add({
    'https://github.com/nvim-tree/nvim-tree.lua'
})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
require("nvim-tree").setup({
    actions = {
	open_file = {
	    quit_on_open = true,
	},
    },
})

-- telescope
vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim'
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- which-key
vim.pack.add({
    'https://github.com/folke/which-key.nvim'
})
require("which-key").setup({})
vim.keymap.set('n', '<leader>?', function() require("which-key").show({global = false}) end, {desc = "Buffer Local Keymaps (which-key)"})

-- toggle-term
vim.pack.add({
    'https://github.com/akinsho/toggleterm.nvim'
})
require("toggleterm").setup{
    direction = "float",
    open_mapping = [[<c-\>]],
    size = function(term)
	if term.direction == "horizontal" then
	    return vim.o.lines * 0.4
	elseif term.direction == "vertical" then
	    return vim.o.columns * 0.4
	end
    end,
}
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", {desc = "Vertical terminal"})
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", {desc = "Horizontal terminal"})
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", {desc = "Floating terminal"})

-- lspconfig
vim.pack.add{
    'https://github.com/neovim/nvim-lspconfig'
}
vim.lsp.enable('clangd')

-- cmp
vim.pack.add{
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-vsnip',
    'https://github.com/hrsh7th/vim-vsnip',
    'https://github.com/hrsh7th/nvim-cmp'
}
local cmp = require("cmp")
cmp.setup({
    snippet = {
	expand = function(args)
	    vim.snippet.expand(args.body)
	end,
    },
    mapping = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
	["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<C-y>"] = cmp.mapping.confirm({select = true}),
    }),
    sources = cmp.config.sources({
	{name = "nvim_lsp"},
	{name = "vsnip"},
    }, {
	{name = "buffer"},
	{name = "path"},
    })
})
cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{name = "buffer"}
    }
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{name = "path"}
    },{
	{name = "cmdline"}
    }),
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("clangd", {capabilities = capabilities})

-- TODO
vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/folke/todo-comments.nvim'
})
require("todo-comments").setup({})
