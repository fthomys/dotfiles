return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc", "bash",
            "javascript", "typescript", "tsx", "html", "css", "json",
            "rust", "go", "c",
            "python",
            "kotlin", "java",
            "c_sharp",
            "yaml", "helm",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
