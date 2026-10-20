return {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/SchemaStore.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local dir = vim.fn.stdpath("config") .. "/lua/lsp"
        for _, file in ipairs(vim.fn.glob(dir .. "/*.lua", false, true)) do
            local name = vim.fn.fnamemodify(file, ":t:r")
            vim.lsp.config(name, require("lsp." .. name))
            vim.lsp.enable(name)
        end
    end,
}
