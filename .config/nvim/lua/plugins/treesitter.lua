return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
       highlight = {
           enable = true
       },
       indent = {
           enable = true
       }
   }
}
