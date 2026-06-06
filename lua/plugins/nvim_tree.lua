return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  -- Load eagerly at startup so the auto-open VimEnter hook below can fire.
  lazy = false,
  config = function()
    -- Buffer-local keymaps for navigating inside the tree.
    local function on_attach(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Keep all of nvim-tree's sensible defaults...
      api.config.mappings.default_on_attach(bufnr)

      -- ...then layer vim-style navigation on top.
      -- Open / expand
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open / Expand'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open / Expand'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open / Expand'))
      vim.keymap.set('n', 'L', api.tree.expand_all, opts('Expand All'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Preview (stay in tree)'))

      -- Close / collapse
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse All'))

      -- Move around the tree
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Goto Parent'))
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
      vim.keymap.set('n', '<C-p>', api.node.navigate.sibling.prev, opts('Prev Sibling'))
      vim.keymap.set('n', '<C-n>', api.node.navigate.sibling.next, opts('Next Sibling'))

      -- Jump between git changes / diagnostics
      vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
      vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
      vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
      vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))

      -- Change the tree root (drill in / step out)
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD into Directory'))
      vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('CD up one level'))

      -- Window navigation: keep <C-h/j/k/l> moving between windows even inside
      -- the tree (default nvim-tree shadows <C-k> with the info popup).
      vim.keymap.set('n', '<C-h>', '<C-w>h', opts('Window left'))
      vim.keymap.set('n', '<C-j>', '<C-w>j', opts('Window down'))
      vim.keymap.set('n', '<C-k>', '<C-w>k', opts('Window up'))
      vim.keymap.set('n', '<C-l>', '<C-w>l', opts('Window right'))

      -- Misc
      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close Tree'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Show Help'))
    end

    require('nvim-tree').setup {
      on_attach = on_attach,

      -- Disable netrw at the very start of your init.lua (recommended)
      disable_netrw = true,
      hijack_netrw = true,

      -- Update the focused file on BufEnter, un-collapse the folders recursively
      update_focused_file = {
        enable = true,
        update_root = false,
      },

      -- Show git status (kept async; bump the timeout so it never blocks the UI)
      git = {
        enable = true,
        timeout = 500,
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
          -- false = arrows get their own column so the indent guide lines are
          -- drawn for EVERY row, including folders. With `true`, a folder's
          -- arrow replaces its connector line, so a folder-only directory shows
          -- no guide lines at all.
          inline_arrows = false,
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
            default = "󰈙",
            symlink = "",
            bookmark = "󰃀",
            modified = "●",

            -- Folder icons
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "󰜌",
              empty_open = "󰜌",
              symlink = "",
              symlink_open = "",
            },

            -- Git status icons
            git = {
              unstaged = "󰄱",
              staged = "󰱒",
              unmerged = "",
              renamed = "󰁕",
              untracked = "",
              deleted = "󰍵",
              ignored = "󰿠",
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
        -- Hide git-ignored files (node_modules, target, build, ...). This is the
        -- biggest speedup: far fewer files to scan, watch, git-status and render.
        git_ignored = true,
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

    -- Make the indent guide lines actually visible against the colorscheme.
    -- (The markers were enabled already, but NvimTreeIndentMarker was too dark.)
    local function set_tree_highlights()
      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#5c6773" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", { fg = "#5c6773" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", { fg = "#5c6773" })
    end
    set_tree_highlights()
    -- Re-apply if the colorscheme is (re)loaded.
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_tree_highlights })

    -- Auto-open the tree on startup so the user is immediately aware of the
    -- project structure, but keep the cursor on the file/editor.
    local function open_tree_on_startup(data)
      local api = require("nvim-tree.api")
      local is_dir = vim.fn.isdirectory(data.file) == 1
      local is_real_file = vim.fn.filereadable(data.file) == 1
      local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      if is_dir then
        -- Opened with a directory arg (e.g. `nvim .`): cd into it and open tree.
        vim.cmd.cd(data.file)
        api.tree.open()
      elseif is_real_file then
        -- Opened with a file: show tree alongside, keep focus on the file.
        api.tree.toggle({ focus = false, find_file = true })
      elseif is_no_name then
        -- Bare `nvim`: just open the tree.
        api.tree.open()
      end
    end
    vim.api.nvim_create_autocmd("VimEnter", { callback = open_tree_on_startup })

    -- Keybindings for nvim-tree
    vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set('n', '<Leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "Find file in NvimTree" })
    vim.keymap.set('n', '<Leader>ec', ':NvimTreeCollapse<CR>', { noremap = true, silent = true, desc = "Collapse NvimTree" })
    -- Jump focus back to the tree on the left from any editor window (without
    -- toggling it closed like <Leader>e would).
    vim.keymap.set('n', '<Leader>wt', ':NvimTreeFocus<CR>', { noremap = true, silent = true, desc = "Focus NvimTree (back to tree)" })
  end
}
