return {
  "EdenEast/nightfox.nvim",
  name = "nightfox",
  config = function()
    require("nightfox").setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })
    vim.cmd([[colorscheme nightfox]])
  end,
  lazy = false,
  priority = 1000,
}

-- guifg=#434953 guibg=#00
