return {
  "FabijanZulj/blame.nvim",
  event = "User FilePost",
  config = function()
    require("blame").setup {
      virtual_style = "right_align",
    }
  end,
}
