return {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    config = function()
        require("smear_cursor").setup({
            stiffness = 0.7,
            trailing_stiffness = 0.69,
            never_draw_over_target = false,
        })
    end,
}
