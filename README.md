# Neovim Configuration

This is a modern Neovim configuration based on Lua, using `lazy.nvim` as the plugin manager.
It is designed to be a powerful and extensible development environment for a wide range of languages.

## Installation

This configuration is managed by `lazy.nvim`. When you start Neovim for the first time, `lazy.nvim` will automatically install all the plugins.

## Features

This configuration includes a wide range of features, including:

*   **Plugin Management:** Using `lazy.nvim` for fast and declarative plugin management.
*   **Code Completion:** Powered by `coc.nvim`, with support for a wide range of languages.
*   **LSP (Language Server Protocol):** Integrated with `coc.nvim` for features like go-to-definition, find references, hover information, and more.
*   **Debugging:** Using `vimspector` and `nvim-dap` for a rich debugging experience in various languages.
*   **Fuzzy Finding:** With `fzf.vim` for quickly finding files, buffers, commits, etc.
*   **File Explorer:** With `nerdtree` and `nvim-tree.lua`.
*   **Git Integration:** With `vim-signify` to show git diffs in the sign column.
*   **Statusline and Tabline:** With `lightline.vim` and `barbar.nvim`.
*   **Syntax Highlighting and Colorschemes:** A variety of colorschemes are included.
*   **Jupyter Notebook support:** With `iron.nvim` and `jupytext.vim`.
*   **And much more...**

More sections will be added soon with a detailed list of key mappings and commands.



## Key Mappings



### Global Key Mappings



| Mode | Keymap | Description |

|---|---|---|

| Insert | `jk` | Go to Normal mode |

| Normal | `<C-s>` | Save the current file |

| Insert | `<C-s>` | Save the current file |

| Normal | `<C-q>` | Quit |

| Insert | `<C-q>` | Quit |

| Normal | `<S-Up>` | Move current line up |

| Normal | `<S-Down>` | Move current line down |

| Insert | `<S-Up>` | Move current line up |

| Insert | `<S-Down>` | Move current line down |

| Normal | `<C-h>` | Move to the left split |

| Normal | `<C-j>` | Move to the bottom split |

| Normal | `<C-k>` | Move to the top split |

| Normal | `<C-l>` | Move to the right split |

| Normal | `<F6>` | Toggle spell check |

| Normal | `<Leader>vf` | Select function |

| Terminal | `<Esc>` | Go to Normal mode from terminal |

| Terminal | `jk` | Go to Normal mode from terminal |

| Normal | `<space>e` | Edit the vimrc file |

| Normal | `<space>r` | Reload the vimrc file |

| Normal | `<Leader>tv` | Open a vertical terminal |

| Normal | `<Leader>th` | Open a horizontal terminal |

| Normal | `c*` | Change word under cursor (and next occurrences) |

| Normal | `d*` | Delete word under cursor (and next occurrences) |

| Normal | `cp` | Replace word with yanked text |

### CoC Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `[g` | Go to previous diagnostic |
| Normal | `]g` | Go to next diagnostic |
| Normal | `gd` | Go to definition |
| Normal | `gy` | Go to type definition |
| Normal | `gi` | Go to implementation |
| Normal | `gr` | Go to references |
| Normal | `K` | Show documentation |
| Normal | `<leader>rn` | Rename symbol |
| Normal | `<leader>rf` | Refactor symbol |
| Visual | `<leader>f` | Format selected code |
| Normal | `<leader>f` | Format selected code |
| Normal | `<leader>fa` | Format with code action |
| Visual | `<leader>a` | Apply code action to selection |
| Normal | `<leader>a` | Apply code action to selection |
| Normal | `<leader>ac` | Apply code action |
| Normal | `<leader>qf` | Apply quick fix |
| Visual | `if` | Select inside function |
| Operator-pending | `if` | Select inside function |
| Visual | `af` | Select around function |
| Operator-pending | `af` | Select around function |
| Visual | `ic` | Select inside class |
| Operator-pending | `ic` | Select inside class |
| Visual | `ac` | Select around class |
| Operator-pending | `ac` | Select around class |
| Normal | `<C-s>` | Select range |
| Visual | `<C-s>` | Select range |
| Normal | `<space>a` | List diagnostics |
| Normal | `<space>e` | List extensions |
| Normal | `<space>c` | List commands |
| Normal | `<space>o` | List outline |
| Normal | `<space>s` | List workspace symbols |
| Normal | `<space>j` | Go to next item in list |
| Normal | `<space>k` | Go to previous item in list |
| Normal | `<space>p` | Resume last CoC list |
| Insert | `<C-space>` | Trigger completion |
| Insert | `<CR>` | Confirm completion |
| Insert | `<Tab>` | Next completion item / snippet jump |
| Insert | `<S-Tab>` | Previous completion item |
| Insert | `<C-j>` | Next completion item / snippet jump |
| Insert | `<C-k>` | Previous completion item |
| Insert | `<C-l>` | Expand/jump snippet |
| Visual | `<C-j>` | Select snippet placeholder |
| Insert | `<C-;>` | Expand snippet |
| Visual | `<leader>x` | Convert selection to snippet |

### FZF Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<C-p>` | Find files (respecting .gitignore) |
| Insert | `<C-i>` | Find files (respecting .gitignore) |
| Normal | `<C-B>` | Find open buffers |
| Normal | `<C-L>` | Find lines in current buffer |
| Normal | `<Leader>fzl` | Find lines in current buffer |
| Normal | `<Leader>fzb` | Find open buffers |
| Normal | `<Leader>fzc` | Find commits |

### NERDTree Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<Leader>nt` | Toggle NERDTree |
| Normal | `<Leader>ntf` | Focus NERDTree |
| Normal | `<Leader>1` | Focus NERDTree |
| Normal | `<Leader>ntr` | Refresh NERDTree root |
| Normal | `<Leader>ntt` | Open selected file in a new tab |

### Barbar Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<A-,>` | Go to previous buffer |
| Normal | `<A-.>` | Go to next buffer |
| Normal | `<A-<>` | Move buffer to the left |
| Normal | `<A->>` | Move buffer to the right |
| Normal | `<A-1>` to `<A-8>` | Go to buffer 1 to 8 |
| Normal | `<A-9>` | Go to last buffer |
| Normal | `<A-c>` | Close buffer |
| Normal | `<C-s>` | Pick a buffer |
| Normal | `<Space>bd` | Sort buffers by directory |
| Normal | `<Space>bl` | Sort buffers by language |

### Tagbar Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<leader>po` | Toggle Tagbar |

### Vimspector Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<leader>vl` | Launch debugger |
| Normal | `<leader>vr` | Reset debugger |
| Normal | `<leader>ve` | Evaluate expression |
| Normal | `<leader>vw` | Watch expression |
| Normal | `<leader>vo` | Show output |
| Visual | `<leader>vi` | Evaluate expression in balloon |
| Normal | `<leader>vc` | Clear breakpoints |
| Normal | `<F1>` | Start Java debugging with Vimspector |

### Scala (nvim-metals) Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `gD` | Go to definition |
| Normal | `K` | Show documentation |
| Normal | `gi` | Go to implementation |
| Normal | `gr` | Go to references |
| Normal | `gds` | Go to document symbol |
| Normal | `gws` | Go to workspace symbol |
| Normal | `<leader>cl` | Run code lens |
| Normal | `<leader>sh` | Show signature help |
| Normal | `<leader>rn` | Rename symbol |
| Normal | `<leader>f` | Format buffer |
| Normal | `<leader>ca` | Code action |
| Normal | `<leader>ws` | Hover worksheet |
| Normal | `<leader>ns` | New Scala file |
| Normal | `<Leader>ws` | Expand decoration |

### DAP Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<leader>dc` | Continue |
| Normal | `<leader>dr` | Toggle REPL |
| Normal | `<leader>dK` | Hover |
| Normal | `<leader>dt` | Toggle breakpoint |
| Normal | `<leader>dcl` | Clear breakpoints |
| Normal | `<leader>dso` | Step over |
| Normal | `<leader>dsi` | Step into |
| Normal | `<leader>dl` | Run last |
| Normal | `<leader>bb` | Toggle breakpoint (dap-ui) |
| Normal | `<leader>bo` | Open DAP UI |
| Normal | `<leader>bc` | Close DAP UI |

### Colorscheme Switcher Key Mappings

| Mode | Keymap | Description |
|---|---|---|
| Normal | `<F8>` | Next colorscheme |
| Normal | `<F7>` | Previous colorscheme |

## Custom Commands

| Command | Description |
|---|---|
| `:Format` | Format the current buffer |
| `:Fold` | Fold the current buffer |
| `:OR` | Organize imports in the current buffer |
| `:Prettier` | Format the current buffer with Prettier |
| `:FZFGitIgnore` | Find files, respecting .gitignore |
