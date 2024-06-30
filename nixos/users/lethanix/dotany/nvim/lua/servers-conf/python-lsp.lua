local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
    vim.cmd [[
	function! PythonFormat()
	    silent !black %
	    let view = winsaveview()
	    silent edit
	    call winrestview(view)
	    redraw!
	endfunction

	augroup pythonFormat
	    autocmd!
	    autocmd BufWritePost * if &filetype ==# 'python' | call PythonFormat() | endif
	augroup END
    ]]
    --TODO: change above code to lua functions/api
    -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format { async=true }]]
    -- local pythonFormatGrp = vim.api.nvim_create_augroup("PythonFormatter", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
	-- pattern = "*.py",
	-- callback = function ()
	    -- vim.fn.jobstart({"black", vim.fn.expand('%')})
	-- end,
	-- group = pythonFormatGrp,
    -- })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
