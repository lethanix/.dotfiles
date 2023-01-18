-- LSP keymaps
-- Aux function to easily define mappings
local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end
	local opts = { buffer = true, desc = desc }

	vim.keymap.set("n", keys, func, opts)
end

nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<C-k", vim.lsp.buf.signature_help, "Signature Documentation")

nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
nmap("<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")

local lsp_formatting = function(bufnr)
	-- List to filter the formatting -> null-ls client will handle it
	local denylist = {
		clangd = true,
		pyright = true,
	}

	vim.lsp.buf.format({
		filter = function(client)
			if denylist[client.name] then
				return false
			end
			return true
		end,
		bufnr = bufnr,
	})
end

nmap("<leader>lf", function()
	lsp_formatting(0)
end, "[F]ormat file")

-- Formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local bufnr = 0
vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	buffer = bufnr,
	callback = function()
		lsp_formatting(bufnr)
	end,
})

-- Use LSP as the handler for formatexpr.
--    See `:help formatexpr` for more information.
vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
