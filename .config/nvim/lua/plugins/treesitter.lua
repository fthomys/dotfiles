return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc",
            "javascript", "typescript", "tsx", "html", "css", "json",
            "rust", "go", "c",
            "python",
            "kotlin", "java",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
