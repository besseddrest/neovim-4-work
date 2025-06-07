local map = vim.keymap.set

-- Remap 'Q' to 'q'
vim.cmd("cabbrev Q q")
vim.cmd("cabbrev Qa qa")

-- NOTE: THE BASICS, BUT ENHANCED
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- keep cursor centered
-- map("n", "}", "{zz", { desc = "Jump Up Blank Line" })
-- map("n", "{", "}zz", { desc = "Jump Down Blank Line" })
-- map("n", "<Up>", "<Up>zz", { desc = "Navigate Up" })
-- map("n", "<Down>", "<Down>zz", { desc = "Navigate Down" })
-- map("n", "k", "kzz", { desc = "Navigate Up" })
-- map("n", "j", "jzz", { desc = "Navigate Down" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Jump Up" })
-- map("n", "<C-d>", "<C-d>zz", { desc = "Jump Down" })

-- NOTE: EDITOR

-- (n)o (h)ighlight
map("n", "<leader>nh", "<CMD>noh<CR>", { desc = "Hide Search Matches" })

-- (i)nlay hints
map("n", "<leader>i", function()
	vim.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Inlay Hint Toggle" })

-- (f)ind and (r)eplace
map("n", "<leader>fr", ":%s/", { desc = "Find/Search and Replace" })

-- (o)pen (d)iagnostic float
map("n", "<leader>od", function()
	return vim.diagnostic.open_float({ width = 50 })
end)

-- greatest remap ever (ThePrimeagen)
map("x", "<leader>p", "_dP")

-- window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

-- (f)or(m)at
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "format files" })

-- comments
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- terminals
map({ "n", "t" }, "<A-t>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })
-- map({ "n", "t" }, "<A-h>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal new horizontal term" })
--
-- map({ "t" }, "<A-k>", "<C-w>k", { desc = "terminal focus window up" })
--
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })

-- move line
-- map("n", "<C-j>", ":m .+1<CR>==") -- move line up(n)
-- map("n", "<C-k>", ":m .-2<CR>==") -- move line down(n)
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- terminals
-- map({ "n", "t" }, "<A-t>", function()
--   require("nvchad.term").toggle {
--     pos = "float",
--     id = "floatTerm",
--   }
-- end, { desc = "terminal toggle floating term" })

-- NOTE: PLUGIN SPECIFIC

map("n", "<leader><BS>", "<cmd>bd<CR>", { desc = "Buffer close" })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<leader>bh", "<cmd>split | enew<CR>", { desc = "Buffer new horizontal split" })
map("n", "<leader>bv", "<cmd>vsplit | enew<CR>", { desc = "Buffer new vertical split" })

-- DadBod: (db)UI
map("n", "<leader>db", "<cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>", { desc = "DBUI toggle" })

-- MiniFiles
map("n", "<C-n>", "<cmd>lua MiniFiles.open()<cr>", { desc = "MiniFiles Toggle" })

-- Telescope
map("n", "<leader>G", "<cmd>lua Snacks.picker.grep()<CR>", { desc = "Live Grep" })
map("n", "<leader>R", "<cmd>lua Snacks.picker.recent()<cr>", { desc = "Recent Picker" })
map("n", "<leader>F", "<cmd>lua Snacks.picker.files()<cr>", { desc = "Find Files" })
map("n", "<leader>B", "<cmd>lua Snacks.picker.buffers()<cr>", { desc = "Buffers List" })
map("n", "<leader>L", "<cmd>lua Snacks.picker.highlights()<cr>", { desc = "Highlights" })
map("n", "<leader>T", function()
	require("nvchad.themes").open({
		border = true,
	})
end, { desc = "Themes" })

-- map("n", "<leader>R", "<cmd>Telescope resume<CR>", { desc = "Resume Live Grep" })
-- map("n", "<leader>F", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
-- map("n", "<leader>T", "<cmd>Telescope themes<CR>", { desc = "Themes" })
-- map("n", "<leader>N", "<cmd>Telescope notify<CR>", { desc = "Notify" })
-- map("n", "<leader>L", "<cmd>Telescope highlights<CR>", { desc = "Highlights" })
-- map("n", "<leader>B", "<cmd>Telescope buffers<CR>", { desc = "Buffers List" })

-- Neogit
-- map("n", "<leader>ng", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- NeoMiniMap
map("n", "<leader>mm", "<cmd>Neominimap toggle<CR>", { desc = "NeoMiniMap Toggle" })

-- Blame
map("n", "<leader>bt", "<cmd>BlameToggle<CR>", { desc = "Blame Toggle" })

-- Gitsigns
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview Hunk" })

-- Tabufline
map("n", "<C-t>n", "<cmd>tabnew<cr>", { desc = "Tab New" })
map("n", "<C-t><BS>", "<cmd>tabclose<cr>", { desc = "Tab Close" })
map("n", "<C-t>]", "<cmd>tabn<cr>", { desc = "Tab Next" })
map("n", "<C-t>[", "<cmd>tabp<cr>", { desc = "Tab Prev" })

-- Buffers
-- map("n", "<tab>", function()
--   require("nvchad.tabufline").next()
-- end, { desc = "buffer goto next" })
--
-- map("n", "<S-tab>", function()
--   require("nvchad.tabufline").prev()
-- end, { desc = "buffer goto prev" })
--
-- map("n", "<leader><BS>", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
