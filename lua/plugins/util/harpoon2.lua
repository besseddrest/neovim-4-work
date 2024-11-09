return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "User FilePost",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require "harpoon"
    local notify = require "notify"
    local kmset = vim.keymap.set

    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }
    -- REQUIRED

    kmset("n", "<leader>hi", function()
      harpoon:list():add()
      notify "Harpoon'd"
    end)

    kmset("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    kmset("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    kmset("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    kmset("n", "<leader>4", function()
      harpoon:list():select(4)
    end)
    kmset("n", "<leader>H", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    kmset("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    kmset("n", "<C-S-N>", function()
      harpoon:list():next()
    end)

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    kmset("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
