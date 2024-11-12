return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  ft = {
    "js",
    "ts",
    "jsx",
    "tsx",
    "html",
    "xhtml",
    "xml",
    "xsl",
  },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
