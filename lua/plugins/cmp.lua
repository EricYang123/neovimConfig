return {
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	    "hrsh7th/nvim-cmp",
	    "hrsh7th/cmp-vsnip",
	    "hrsh7th/vim-vsnip",
	},
	config = function()
	    local cmp = require("cmp")
	    cmp.setup({
		snippet = {
		    expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		    end,
		},
		mapping = cmp.mapping.preset.insert({
		    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
		    ["<C-f>"] = cmp.mapping.scroll_docs(4),
		    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		    ["<C-Space>"] = cmp.mapping.complete(),
		    ['<C-e>'] = cmp.mapping.abort(),
		    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
		    { name = "nvim_lsp" },
		    { name = "vsnip" } ,
		}, {
		    { name = "buffer" },
		    { name = "path" },
		})
	    })

	    cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = "buffer" }
		}
	    })

	    cmp.setup.cmdline( ":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = "path" }
		}, {
		    { name = "cmdline" }
		}),
	    })

	    local capabilities = require("cmp_nvim_lsp").default_capabilities()
	    vim.lsp.config("clangd", {capabilities = capabilities })
	end,
    },
}
