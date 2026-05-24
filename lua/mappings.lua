local map = vim.keymap.set

-- NOTE: general QOL
-- enter
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>", { desc = "Escape from current motion" })

-- Remap 'Q' to 'q' to quit application
vim.cmd("cabbrev Q q")
vim.cmd("cabbrev Qa qa")

-- Basic motions, but followed by `zz` to keep cursor centered
map("n", "}", "}zz", { desc = "Jump Down Blank Line" })
map("n", "{", "{zz", { desc = "Jump Up Blank Line" })
map("n", "<Up>", "<Up>zz", { desc = "Navigate Up" })
map("n", "<Down>", "<Down>zz", { desc = "Navigate Down" })
map("n", "k", "kzz", { desc = "Navigate Up" })
map("n", "j", "jzz", { desc = "Navigate Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Jump Up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Jump Down" })

-- (n)o (h)ighlight
map("n", "<leader>nh", "<CMD>noh<CR>", { desc = "Hide Search Matches" })

-- (i)nlay hints
map("n", "<leader>i", function()
    vim.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
end, { desc = "Inlay Hint Toggle" })

-- (f)ind and (r)eplace in current file
map("n", "<leader>fr", ":%s/", { desc = "Find/Search and Replace" })

-- (o)pen (d)iagnostic
map("n", "<leader>od", function()
    return vim.diagnostic.open_float({ width = 50 })
end, { desc = "Opens Diagostic messages in a floated tooltip" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to Definition" })

-- greatest remap ever (ThePrimeagen)
map("x", "<leader>p", "_dP")

-- moves focus to different splits and or panes
map("n", "<C-h>", "<C-w>h", { desc = "focus pane left" })
map("n", "<C-j>", "<C-w>j", { desc = "focus pane down" })
map("n", "<C-k>", "<C-w>k", { desc = "focus pane up" })
map("n", "<C-l>", "<C-w>l", { desc = "focus pane right" })

-- comments
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- Open a terminal
map({ "n", "t" }, "<A-t>", function()
    require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

-- NOTE: PLUGIN SPECIFIC

map("n", "<leader><BS>", "<cmd>bd<CR>", { desc = "Buffer close" })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<leader>bh", "<cmd>split | enew<CR>", { desc = "Buffer new horizontal split" })
map("n", "<leader>bv", "<cmd>vsplit | enew<CR>", { desc = "Buffer new vertical split" })

-- MiniFiles (open file tree)
map("n", "<C-n>", "<cmd>lua MiniFiles.open()<cr>", { desc = "MiniFiles Toggle" })

-- NvimTree (alternate file tree)
map("n", "<C-s>", "<cmd>NvimTreeToggle<cr>", { desc = "Nvim Tree Toggle" })

-- Pickers
map("n", "<leader>G", "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.grep()<cr>", { desc = "Live Grep" })
map(
    "n",
    "<leader>R",
    "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.recent()<cr>",
    { desc = "Recent Picker" }
)
map("n", "<leader>F", "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.files()<cr>", { desc = "Find Files" })
map(
    "n",
    "<leader>B",
    "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.buffers()<cr>",
    { desc = "Buffers List" }
)
map(
    "n",
    "<leader>L",
    "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.highlights()<cr>",
    { desc = "Highlights" }
)
map(
    "n",
    "<leader>N",
    "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.notifications()<cr>",
    { desc = "Notifications" }
)
map(
    "n",
    "<leader>C",
    "<cmd>lua MiniFiles.close()<cr><bar><cmd>lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})<cr>",
    { desc = "Nvim Config" }
)
map("n", "<leader>T", function()
    require("nvchad.themes").open({
        border = true,
    })
end, { desc = "Themes" })

-- Blame
map("n", "<leader>bt", "<cmd>BlameToggle<CR>", { desc = "Blame Toggle" })

-- Gitsigns
map("n", "<leader>hu", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview Hunk" })
