# Neovim Configuration Guide

Complete keyboard shortcuts and function reference for this Neovim configuration.

**Leader Key:** `,` (comma)
**Neovim Version:** 0.9.5+

---

## Table of Contents

- [General](#general)
- [File Navigation](#file-navigation)
- [Window & Buffer Management](#window--buffer-management)
- [Code Navigation (CoC LSP)](#code-navigation-coc-lsp)
- [Code Editing](#code-editing)
- [Code Formatting & Refactoring](#code-formatting--refactoring)
- [Code Completion](#code-completion)
- [Debugging (Vimspector)](#debugging-vimspector)
- [File Explorer (NERDTree)](#file-explorer-nerdtree)
- [Fuzzy Finder (FZF)](#fuzzy-finder-fzf)
- [Code Outline](#code-outline)
- [Terminal](#terminal)
- [Commands](#commands)

---

## General

| Shortcut | Mode | Description |
|----------|------|-------------|
| `jk` | Insert | Exit insert mode (alternative to `Esc`) |
| `Ctrl+s` | Normal | Save file |
| `Ctrl+s` | Insert | Save file (returns to insert mode) |
| `Ctrl+q` | Normal | Quit |
| `Ctrl+q` | Insert | Quit |
| `F6` | Normal | Toggle spell check (English US) |
| `Space+e` | Normal | Edit config file (open init.lua in vertical split) |
| `Space+r` | Normal | Reload config file |

---

## File Navigation

### FZF (Fuzzy Finder)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+p` | Normal | Search files (respects .gitignore) |
| `Ctrl+i` | Insert | Search files (respects .gitignore) |
| `Ctrl+b` | Normal | Search open buffers |
| `Ctrl+l` | Normal | Search lines in all buffers |
| `,fzl` | Normal | Search lines in all buffers |
| `,fzb` | Normal | Search open buffers |
| `,fzc` | Normal | Search git commits |

### NERDTree (File Explorer)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,nt` | Normal | Open NERDTree |
| `,ntf` | Normal | Focus NERDTree |
| `,1` | Normal | Focus NERDTree (quick access) |
| `,ntr` | Normal | Refresh NERDTree root |
| `,ntt` | Normal | Open file in new tab (when in NERDTree) |

**NERDTree Window Commands:**
- `o` - Open file/directory
- `t` - Open in new tab
- `i` - Open in horizontal split
- `s` - Open in vertical split
- `m` - Show menu (add/delete/move files)
- `R` - Refresh tree
- `q` - Close NERDTree

---

## Window & Buffer Management

### Window Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+h` | Normal | Move to left window |
| `Ctrl+j` | Normal | Move to down window |
| `Ctrl+k` | Normal | Move to up window |
| `Ctrl+l` | Normal | Move to right window |

### Buffer Management (Barbar)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Alt+,` | Normal | Go to previous buffer |
| `Alt+.` | Normal | Go to next buffer |
| `Alt+<` | Normal | Move buffer to previous position |
| `Alt+>` | Normal | Move buffer to next position |
| `Alt+1` to `Alt+8` | Normal | Go to buffer 1-8 |
| `Alt+9` | Normal | Go to last buffer |
| `Alt+c` | Normal | Close current buffer |
| `Ctrl+s` | Normal | Pick buffer (interactive) |
| `Space+bd` | Normal | Order buffers by directory |
| `Space+bl` | Normal | Order buffers by language |

---

## Code Navigation (CoC LSP)

### Go To Definition/References

| Shortcut | Mode | Description |
|----------|------|-------------|
| `gd` | Normal | Go to definition |
| `gy` | Normal | Go to type definition |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Find references |
| `K` | Normal | Show documentation/hover info |
| `[g` | Normal | Previous diagnostic |
| `]g` | Normal | Next diagnostic |

### Text Objects

| Shortcut | Mode | Description |
|----------|------|-------------|
| `if` | Visual/Operator | Inner function |
| `af` | Visual/Operator | Around function |
| `ic` | Visual/Operator | Inner class |
| `ac` | Visual/Operator | Around class |

### CoC Lists

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Space+a` | Normal | Show diagnostics list |
| `Space+e` | Normal | Show extensions list |
| `Space+c` | Normal | Show commands list |
| `Space+o` | Normal | Show outline/symbols |
| `Space+s` | Normal | Search workspace symbols |
| `Space+j` | Normal | Next item in CoC list |
| `Space+k` | Normal | Previous item in CoC list |
| `Space+p` | Normal | Resume last CoC list |

---

## Code Editing

### Line Movement

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Shift+Up` | Normal | Move line up |
| `Shift+Down` | Normal | Move line down |
| `Shift+Up` | Insert | Move line up |
| `Shift+Down` | Insert | Move line down |

### Selection & Editing

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,vf` | Normal | Select function (visual select inside braces) |
| `c*` | Normal | Change word under cursor (repeatable) |
| `d*` | Normal | Delete word under cursor (repeatable) |
| `cp` | Normal | Replace with yanked text (motion-based) |

---

## Code Formatting & Refactoring

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,rn` | Normal | Rename symbol |
| `,rf` | Normal | Refactor |
| `,f` | Normal/Visual | Format selected code |
| `,fa` | Normal | Format entire file |
| `,a` | Normal/Visual | Code action (selected) |
| `,ac` | Normal | Code action (current line) |
| `,qf` | Normal | Quick fix current issue |
| `,x` | Visual | Convert to snippet |

### Commands

| Command | Description |
|---------|-------------|
| `:Format` | Format entire file |
| `:Prettier` | Format with Prettier |
| `:OR` | Organize imports |
| `:Fold` | Fold code |

---

## Code Completion

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+Space` | Insert | Trigger completion |
| `Tab` | Insert | Next completion item |
| `Shift+Tab` | Insert | Previous completion item |
| `Ctrl+j` | Insert | Next completion item (alternative) |
| `Ctrl+k` | Insert | Previous completion item (alternative) |
| `Enter` | Insert | Confirm completion |

### Snippets

| Shortcut | Mode | Description |
|----------|------|-------------|
| `Ctrl+l` | Insert | Expand snippet and jump to next placeholder |
| `Ctrl+j` | Visual | Select snippet |
| `Ctrl+;` | Insert | Expand snippet |
| `Tab` | Insert | Next snippet placeholder |

---

## Debugging (Vimspector)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,vl` | Normal | Launch debugger |
| `,vr` | Normal | Reset debugger |
| `,ve` | Normal | Evaluate expression |
| `,vw` | Normal | Watch expression |
| `,vo` | Normal | Show debugger output |
| `,vi` | Visual | Evaluate selection (balloon) |
| `,vc` | Normal | Clear all breakpoints |
| `F1` | Normal | Start Java debug |
| `F5` | Normal | Continue/Start (Vimspector HUMAN mode) |
| `F3` | Normal | Stop debugging (Vimspector HUMAN mode) |
| `F4` | Normal | Restart debugging (Vimspector HUMAN mode) |
| `F6` | Normal | Pause (Vimspector HUMAN mode) |
| `F9` | Normal | Toggle breakpoint (Vimspector HUMAN mode) |
| `F10` | Normal | Step over (Vimspector HUMAN mode) |
| `F11` | Normal | Step into (Vimspector HUMAN mode) |
| `F12` | Normal | Step out (Vimspector HUMAN mode) |

---

## Code Outline

### Symbols Outline

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,so` | Normal | Toggle symbols outline |

**Symbols Outline Window Commands:**
- `Enter` - Jump to symbol
- `o` - Toggle fold
- `K` - Toggle preview
- `h` - Fold symbol
- `l` - Unfold symbol
- `W` - Fold all
- `E` - Unfold all
- `R` - Reset folds
- `r` - Rename symbol
- `a` - Code actions
- `q` / `Esc` - Close outline

### Tagbar

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,po` | Normal | Toggle tagbar |

---

## Terminal

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,tv` | Normal | Open terminal in vertical split |
| `,th` | Normal | Open terminal in horizontal split |
| `Esc` | Terminal | Switch to normal mode |
| `jk` | Terminal | Switch to normal mode |

---

## Commands

### Custom Commands

| Command | Description |
|---------|-------------|
| `:Format` | Format current file with CoC |
| `:Prettier` | Format file with Prettier |
| `:OR` | Organize imports |
| `:Fold` | Fold code based on language |
| `:FZFGitIgnore` | Search files (respecting .gitignore) |
| `:SymbolsOutline` | Toggle symbols outline |
| `:TagbarToggle` | Toggle tagbar |

### Useful Built-in Vim Commands

| Command | Description |
|---------|-------------|
| `:e <file>` | Edit/open file |
| `:w` | Write/save file |
| `:q` | Quit window |
| `:wq` | Write and quit |
| `:q!` | Quit without saving |
| `:bd` | Delete buffer |
| `:sp <file>` | Horizontal split |
| `:vsp <file>` | Vertical split |
| `:tabnew <file>` | Open in new tab |
| `:!<command>` | Execute shell command |

---

## Plugin-Specific Notes

### CoC Extensions

To install CoC extensions, use:
```vim
:CocInstall coc-<extension-name>
```

Common extensions:
- `coc-json` - JSON support
- `coc-tsserver` - TypeScript/JavaScript
- `coc-pyright` - Python
- `coc-java` - Java
- `coc-go` - Go
- `coc-rust-analyzer` - Rust
- `coc-prettier` - Prettier formatting

### Updating Plugins

```vim
:Lazy sync         " Update all plugins
:Lazy clean        " Remove unused plugins
:Lazy update       " Update plugins
```

---

## Tips & Tricks

1. **Quick file search**: Use `Ctrl+p` for fast file navigation
2. **Code navigation**: Use `gd` to jump to definition, `Ctrl+o` to jump back
3. **Multi-cursor editing**: Use visual block mode (`Ctrl+v`) or vim-multiple-cursors
4. **Quick symbol search**: Use `Space+o` for outline, `Space+s` for workspace symbols
5. **Buffer management**: Use `Alt+,` and `Alt+.` to quickly switch between buffers
6. **Terminal workflow**: Open terminal with `,tv`, use `Esc` to enter normal mode

---

## Troubleshooting

### CoC not working
```vim
:checkhealth        " Check Neovim health
:CocInfo            " Check CoC status
:CocRestart         " Restart CoC server
```

### Plugins not loading
```vim
:Lazy              " Open plugin manager
:Lazy sync         " Sync/install plugins
```

### Treesitter issues
```vim
:TSUpdate          " Update parsers
:TSInstallInfo     " Check installed parsers
```

---

## Configuration Location

- **Main config**: `~/.config/nvim/init.lua`
- **Plugins**: `~/.config/nvim/lua/plugins/`
- **Plugin data**: `~/.local/share/nvim/lazy/`
- **CoC config**: `~/.config/nvim/coc-settings.json`

---

## Contributing

You could fork and create PR if you want.

Thank you!

---

**Last Updated**: 2025-12-20
**Neovim Version**: 0.9.5
