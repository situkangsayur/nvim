return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {
      -- Disable netrw at the very start of your init.lua (recommended)
      disable_netrw = true,
      hijack_netrw = true,

      -- Update the focused file on BufEnter, un-collapse the folders recursively
      update_focused_file = {
        enable = true,
        update_root = false,
      },

      -- Show git status
      git = {
        enable = true,
        ignore = false,
      },

      -- File system watchers
      filesystem_watchers = {
        enable = true,
      },

      -- Renderer configuration
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },

        -- Icon configuration
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",

            -- Folder icons
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },

            -- Git status icons
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },

        -- Special files highlighting
        special_files = {
          "Cargo.toml",
          "Makefile",
          "README.md",
          "readme.md",
          "package.json",
        },
      },

      -- Filters
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "^.git$" },
      },

      -- Actions
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            picker = "default",
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },

      -- View configuration
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
    }

    -- Keybindings for nvim-tree
    vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set('n', '<Leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "Find file in NvimTree" })
    vim.keymap.set('n', '<Leader>ec', ':NvimTreeCollapse<CR>', { noremap = true, silent = true, desc = "Collapse NvimTree" })
  end
}
