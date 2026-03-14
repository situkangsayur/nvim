# Neovim Keymaps Reference

> Auto-generated from config files. Leader key: `,`

## General (init.lua)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| i | `jk` | `<Esc>` | Go to normal mode |
| n | `<C-s>` | `:w<CR>` | Save file |
| i | `<C-s>` | `<Esc>:w<CR>a` | Save file (insert) |
| n | `<C-q>` | `:q<CR>` | Quit |
| i | `<C-q>` | `<Esc>:q<CR>` | Quit (insert) |
| n | `<S-Up>` | `:m-2<CR>` | Move line up |
| n | `<S-Down>` | `:m+<CR>` | Move line down |
| i | `<S-Up>` | `<Esc>:m-2<CR>` | Move line up (insert) |
| i | `<S-Down>` | `<Esc>:m+<CR>` | Move line down (insert) |
| n | `<C-h>` | `<C-w>h` | Move to left split |
| n | `<C-j>` | `<C-w>j` | Move to bottom split |
| n | `<C-k>` | `<C-w>k` | Move to top split |
| n | `<C-l>` | `<C-w>l` | Move to right split |
| n | `<F6>` | `:setlocal spell!` | Toggle spell check |
| n | `<Leader>vf` | `va{V` | Select function |
| t | `<Esc>` | `<C-\><C-n>` | Exit terminal mode |
| t | `jk` | `<C-\><C-n>` | Exit terminal mode |
| n | `<space>e` | `:vsp $MYVIMRC<cr>` | Open init.lua in split |
| n | `<space>r` | `:so $MYVIMRC<cr>` | Reload init.lua |
| n | `<Leader>tv` | `:vsp<CR>:terminal<CR>i` | Vertical terminal |
| n | `<Leader>th` | `:sp<CR>:terminal<CR>i` | Horizontal terminal |
| n | `c*` | `*Ncgn` | Change all word occurrences |
| n | `d*` | `*Ndgn` | Delete all word occurrences |

## File Explorer - NvimTree

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<Leader>e` | `:NvimTreeToggle<CR>` | Toggle NvimTree |
| n | `<Leader>ef` | `:NvimTreeFindFile<CR>` | Find file in tree |
| n | `<Leader>ec` | `:NvimTreeCollapse<CR>` | Collapse tree |

## File Explorer - NERDTree

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<Leader>nt` | `:NERDTree<CR>` | Open NERDTree |
| n | `<Leader>ntf` | `:NERDTreeFocus<CR>` | Focus NERDTree |
| n | `<Leader>1` | `:NERDTreeFocus<CR>` | Focus NERDTree (alt) |
| n | `<Leader>ntr` | `:NERDTreeRefreshRoot<CR>` | Refresh root |

## Buffer Management - Barbar

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<A-,>` | `:BufferPrevious<CR>` | Previous buffer |
| n | `<A-.>` | `:BufferNext<CR>` | Next buffer |
| n | `<A-<>` | `:BufferMovePrevious<CR>` | Move buffer left |
| n | `<A->>` | `:BufferMoveNext<CR>` | Move buffer right |
| n | `<A-1>` .. `<A-8>` | `:BufferGoto N<CR>` | Go to buffer N |
| n | `<A-9>` | `:BufferLast<CR>` | Go to last buffer |
| n | `<A-c>` | `:BufferClose<CR>` | Close buffer |
| n | `<C-s>` | `:BufferPick<CR>` | Pick buffer |
| n | `<Space>bd` | `:BufferOrderByDirectory<CR>` | Order by directory |
| n | `<Space>bl` | `:BufferOrderByLanguage<CR>` | Order by language |

## FZF

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-p>` | `:FZFGitIgnore<CR>` | Fuzzy find files |
| i | `<C-i>` | `:FZFGitIgnore<CR>` | Fuzzy find files (insert) |
| n | `<C-B>` | `:Buffers<CR>` | FZF buffers |
| n | `<C-L>` | `:Lines<CR>` | FZF lines |
| n | `<Leader>fzl` | `:Lines<CR>` | FZF lines (alt) |
| n | `<Leader>fzb` | `:Buffers<CR>` | FZF buffers (alt) |
| n | `<Leader>fzc` | `:Commits<CR>` | FZF commits |

## CoC - Navigation & LSP

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `[g` | `<Plug>(coc-diagnostic-prev)` | Previous diagnostic |
| n | `]g` | `<Plug>(coc-diagnostic-next)` | Next diagnostic |
| n | `gd` | `<Plug>(coc-definition)` | Go to definition |
| n | `gy` | `<Plug>(coc-type-definition)` | Go to type definition |
| n | `gi` | `<Plug>(coc-implementation)` | Go to implementation |
| n | `gr` | `<Plug>(coc-references)` | Find references |
| n | `K` | Show documentation | Show hover docs |

## CoC - Code Actions & Refactoring

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>rn` | `<Plug>(coc-rename)` | Rename symbol |
| n | `<leader>rf` | `<Plug>(coc-refactor)` | Refactor |
| n/x | `<leader>f` | `<Plug>(coc-format-selected)` | Format |
| n | `<leader>fa` | `<Plug>(coc-codeaction-format)` | Format code action |
| n/x | `<leader>a` | `<Plug>(coc-codeaction-selected)` | Code action |
| n | `<leader>ac` | `<Plug>(coc-codeaction)` | Code action (full) |
| n | `<leader>qf` | `<Plug>(coc-fix-current)` | Quick fix |

## CoC - Text Objects

| Mode | Key | Description |
|------|-----|-------------|
| x/o | `if` | Inner function |
| x/o | `af` | Outer function |
| x/o | `ic` | Inner class |
| x/o | `ac` | Outer class |

## CoC - Completion & Snippets

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| i | `<C-space>` | `coc#refresh()` | Trigger completion |
| i | `<CR>` | Confirm | Confirm completion |
| i | `<Tab>` | Next | Next completion item |
| i | `<S-Tab>` | Previous | Previous completion item |
| i | `<C-j>` | Next | Next completion (alt) |
| i | `<C-k>` | Previous | Previous completion (alt) |
| i | `<C-l>` | Expand/jump | Expand/jump snippet |
| v | `<C-j>` | Select | Select snippet |
| i | `<C-;>` | Expand | Expand snippet |
| x | `<leader>x` | Convert | Convert to snippet |

## CoC - Lists

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<space>a` | `:CocList diagnostics` | Diagnostics |
| n | `<space>e` | `:CocList extensions` | Extensions |
| n | `<space>c` | `:CocList commands` | Commands |
| n | `<space>o` | `:CocList outline` | Outline |
| n | `<space>s` | `:CocList -I symbols` | Symbols |
| n | `<space>j` | `:CocNext` | Next item |
| n | `<space>k` | `:CocPrev` | Previous item |
| n | `<space>p` | `:CocListResume` | Resume list |

## Scala (nvim-metals)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `gD` | `vim.lsp.buf.definition` | Go to definition |
| n | `K` | `vim.lsp.buf.hover` | Hover docs |
| n | `gi` | `vim.lsp.buf.implementation` | Go to implementation |
| n | `gr` | `vim.lsp.buf.references` | Find references |
| n | `gds` | `vim.lsp.buf.document_symbol` | Document symbols |
| n | `gws` | `vim.lsp.buf.workspace_symbol` | Workspace symbols |
| n | `<leader>cl` | `vim.lsp.codelens.run` | Run code lens |
| n | `<leader>sh` | `vim.lsp.buf.signature_help` | Signature help |
| n | `<leader>rn` | `vim.lsp.buf.rename` | Rename |
| n | `<leader>f` | `vim.lsp.buf.format` | Format |
| n | `<leader>ca` | `vim.lsp.buf.code_action` | Code actions |
| n | `<leader>ws` | `metals.hover_worksheet()` | Hover worksheet |
| n | `<leader>ns` | `metals.new_scala_file()` | New Scala file |

## DAP (Debugger)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>dc` | `dap.continue()` | Continue |
| n | `<leader>dr` | `dap.repl.toggle()` | Toggle REPL |
| n | `<leader>dK` | `dap.ui.widgets.hover()` | Hover |
| n | `<leader>dt` | `dap.toggle_breakpoint()` | Toggle breakpoint |
| n | `<leader>dcl` | `dap.clear_breakpoints()` | Clear breakpoints |
| n | `<leader>dso` | `dap.step_over()` | Step over |
| n | `<leader>dsi` | `dap.step_into()` | Step into |
| n | `<leader>dl` | `dap.run_last()` | Run last |
| n | `<leader>bb` | `dapui.toggle_breakpoint()` | Toggle breakpoint (UI) |
| n | `<leader>bo` | `dapui.open()` | Open DAP UI |
| n | `<leader>bc` | `dapui.close()` | Close DAP UI |

## Vimspector

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>vl` | `vimspector#Launch()` | Launch debugger |
| n | `<leader>vr` | `:VimspectorReset<CR>` | Reset debugger |
| n | `<leader>ve` | `:VimspectorEval` | Eval expression |
| n | `<leader>vw` | `:VimspectorWatch` | Watch expression |
| n | `<leader>vo` | `:VimspectorShowOutput` | Show output |
| x | `<leader>vi` | `VimspectorBalloonEval` | Balloon eval |
| n | `<leader>vc` | `vimspector#ClearBreakpoints()` | Clear breakpoints |
| n | `<F1>` | Java debug start | Start Java debugger |

## Jupyter / Iron REPL

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>rs` | `:IronRepl` | Start REPL |
| n | `<leader>rr` | `:IronRestart` | Restart REPL |
| n | `<leader>rf` | `:IronFocus` | Focus REPL |
| n | `<leader>rh` | `:IronHide` | Hide REPL |
| n | `<leader>sc` | Send motion | Send motion/visual |
| n | `<leader>sl` | Send line | Send line |
| n | `<leader>sm` | Send mark | Send mark |
| n | `<leader>mc` | Mark motion | Mark motion/visual |
| n | `<leader>md` | Remove mark | Remove mark |
| n | `<leader>s<cr>` | CR | Carriage return |
| n | `<leader>s<space>` | Interrupt | Interrupt REPL |
| n | `<leader>sq` | Exit | Exit REPL |
| n | `<leader>cl` | Clear | Clear REPL |

## Symbols Outline

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>so` | `:SymbolsOutline<CR>` | Toggle Symbols Outline |

**Internal keymaps (within outline window):**

| Key | Description |
|-----|-------------|
| `<Esc>` / `q` | Close |
| `<CR>` | Go to location |
| `o` | Focus location |
| `<C-space>` | Hover symbol |
| `K` | Toggle preview |
| `r` | Rename |
| `a` | Code actions |
| `h` / `l` | Fold / Unfold |
| `W` / `E` | Fold all / Unfold all |
| `R` | Reset folds |

## Treesitter

| Mode | Key | Description |
|------|-----|-------------|
| n | `gnn` | Initialize selection |
| n | `grn` | Increment node selection |
| n | `grc` | Scope incremental |
| n | `grm` | Decrement node selection |

## Colorscheme

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<F8>` | `:NextColorScheme<CR>` | Next colorscheme |
| n | `<F7>` | `:PrevColorScheme<CR>` | Previous colorscheme |

## Gemini AI

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>gg` | `:GeminiToggle` | Toggle Gemini sidebar |
| n | `<leader>gc` | `:GeminiSwitchToCli` | Switch to AI CLI |
| x | `<leader>gS` | `:'<,'>GeminiSend` | Send selection to AI |

## Tagbar

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>po` | `:TagbarToggle<CR>` | Toggle Tagbar |
