local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.stylua.with({
        --     extra_args = { "--indent-width", "4", "--indent-type", "spaces" }
        -- }),
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.black, -- formatting for python
        null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style", "{BasedOnStyle: Google, IndentWidth: 4}" },
        }),
    },
})
