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
- [AI Assistants (Claude Code & Gemini)](#ai-assistants-claude-code--gemini)
- [Debugging (Vimspector)](#debugging-vimspector)
- [File Explorer (NERDTree)](#file-explorer-nerdtree)
- [Fuzzy Finder (FZF)](#fuzzy-finder-fzf)
- [Code Outline](#code-outline)
- [Jupyter Notebooks & REPL](#jupyter-notebooks--repl)
- [Terminal](#terminal)
- [Commands](#commands)
- [Setup & Maintenance](#setup--maintenance)

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

## AI Assistants (Claude Code & Gemini)

Two AI CLIs run inside Neovim. Leader is `,`, so `<leader>k…` = `,k…`.
Both need their CLI on `PATH` (`claude` and `gemini`).

### Claude Code (`,k…`) — full IDE integration

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,kc` | Normal | Toggle the Claude panel — then type your prompt in it |
| `,kf` | Normal | Focus the Claude panel to type |
| `,kb` | Normal | Add the current buffer to Claude's context |
| `,ks` | Visual | Send the selection to Claude as context |
| `,ky` / `,kn` | Normal | Accept / reject a diff Claude proposes |
| `,kr` / `,kC` | Normal | Resume a previous / continue the last session |
| `,km` | Normal | Pick the Claude model |

**Prompting flow:** optionally select code (`,ks`) or add the file (`,kb`) as
context → `,kc` to open the panel and type your instruction → when Claude
proposes an edit it opens as a diff you accept with `,ky` or reject with `,kn`.

### Gemini (`,g…`) — CLI sidebar

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,gg` | Normal | Toggle the Gemini sidebar — type your prompt there |
| `,gc` | Normal | Spawn / switch to the AI CLI session |
| `,gS` | Visual | Send the selection to Gemini as context |

**Prompting flow:** `,gg` opens the sidebar and you type directly; to include
code, select it in visual mode and press `,gS` (capital S).

> Inside an AI panel/terminal, return to normal mode with `<Esc>` or `jk`.
> See `docs/keymaps.md` for the full table.

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

## Jupyter Notebooks & REPL

### Working with Jupyter Notebooks

This config supports Jupyter notebooks through **Jupytext** and **Iron.nvim**.

| Shortcut | Mode | Description |
|----------|------|-------------|
| `,rs` | Normal | Start IPython REPL |
| `,rr` | Normal | Restart REPL |
| `,rf` | Normal | Focus REPL window |
| `,rh` | Normal | Hide REPL window |
| `,sc` | Normal/Visual | Send code to REPL |
| `,sl` | Normal | Send line to REPL |
| `,sm` | Normal | Send mark to REPL |
| `,s<CR>` | Normal | Send and execute |
| `,s<Space>` | Normal | Interrupt execution |
| `,sq` | Normal | Exit REPL |
| `,cl` | Normal | Clear REPL |

### Usage

**Open Jupyter Notebook:**
```bash
nvim notebook.ipynb
```

Jupytext automatically converts `.ipynb` to Python format with cell markers (`# %%`).

**Workflow:**
1. Open `.ipynb` file in Neovim
2. Press `,rs` to start IPython REPL
3. Write/edit code in cells (marked with `# %%`)
4. Visual select code and press `,sc` to execute in REPL
5. Or press `,sl` to execute current line
6. Save file - changes sync back to `.ipynb`

**Cell Format:**
```python
# %% [markdown]
# # Title

# %%
import pandas as pd
df = pd.read_csv('data.csv')

# %%
df.head()
```

**Requirements:**
```bash
pip install ipython ipykernel jupytext
```

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

## Setup & Maintenance

### Initial Setup

#### 1. Install Required Dependencies

**Node.js (for CoC.nvim):**
```bash
# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Restart terminal or source:
source ~/.bashrc  # or ~/.zshrc

# Install Node.js v20 LTS (recommended for CoC)
nvm install 20
nvm use 20
nvm alias default 20

# Verify installation
node --version  # Should show v20.x.x
npm --version
```

**Python (for Jupyter & LSP):**
```bash
# Install Python dependencies
pip install ipython ipykernel jupytext pynvim
```

**Universal CTags (for Tagbar):**
```bash
sudo apt install universal-ctags  # Ubuntu/Debian
# or
brew install universal-ctags       # macOS
```

#### 2. Install Neovim Plugins

```bash
# Open Neovim
nvim

# Install plugins (lazy.nvim will auto-install on first run)
:Lazy sync
```

#### 3. Install CoC Extensions

```vim
" Essential extensions
:CocInstall coc-json coc-tsserver coc-pyright coc-prettier

" Language-specific (install as needed)
:CocInstall coc-java coc-go coc-rust-analyzer coc-html coc-css
```

---

### Updating & Maintenance

#### Update All Plugins

```vim
:Lazy sync         " Sync all plugins
:Lazy update       " Update plugins
:Lazy clean        " Remove unused plugins
```

#### Update CoC Extensions

```vim
:CocUpdate         " Update all CoC extensions
:CocUpdateSync     " Update synchronously
```

#### Update Node.js for CoC

If you get CoC errors related to Node.js:

```bash
# Check current Node version
node --version

# If using Node v24+ or having issues, switch to v20 LTS
nvm install 20
nvm use 20
nvm alias default 20

# Rebuild CoC
nvim
:Lazy clean
:Lazy sync
```

#### Update NVM

```bash
# Update NVM itself
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
```

---

### Common Issues & Solutions

#### CoC Error: `Reflect.hasOwnMetadata is not a function`

**Solution:**
```bash
# Switch to Node.js v20 LTS
nvm install 20
nvm use 20
nvm alias default 20

# Remove and reinstall CoC
rm -rf ~/.local/share/nvim/lazy/coc.nvim

# Restart Neovim
nvim
:Lazy sync
```

#### CoC Not Starting

```vim
:checkhealth        " Check overall health
:CocInfo            " Check CoC status
:CocRestart         " Restart CoC server

" If still not working:
:Lazy clean
:Lazy sync
```

#### Treesitter Errors

```vim
:TSUpdate           " Update all parsers
:TSInstall python   " Install specific parser
:TSInstallInfo      " Check installed parsers
```

#### Plugins Not Loading

```vim
:Lazy              " Open plugin manager UI
:Lazy sync         " Sync plugins
:Lazy restore      " Restore from lockfile
```

---

### Performance Optimization

#### Reduce Startup Time

```bash
# Check startup time
nvim --startuptime startup.log

# View the log
cat startup.log
```

**Tips:**
- Lazy-load plugins with `event`, `ft`, or `cmd`
- Disable unused plugins
- Use `lazy = true` for plugins you don't always need

#### Clear Caches

```bash
# Clear plugin cache
rm -rf ~/.local/share/nvim/lazy/

# Clear CoC cache
rm -rf ~/.config/coc/

# Reinstall
nvim
:Lazy sync
```

---

### Backup & Sync

**Backup your config:**
```bash
# Create backup
cp -r ~/.config/nvim ~/.config/nvim.backup

# Or use git
cd ~/.config/nvim
git add .
git commit -m "Backup config"
git push
```

**Sync across machines:**
```bash
# On new machine
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
nvim
:Lazy sync
:CocInstall coc-json coc-tsserver coc-pyright
```

---

### Node.js Version Management

**Recommended setup for CoC.nvim:**

```bash
# Install specific Node versions
nvm install 20      # LTS (recommended)
nvm install 18      # Older LTS
nvm install 22      # Latest LTS

# List installed versions
nvm list

# Switch between versions
nvm use 20          # Use v20
nvm use 18          # Use v18

# Set default for new shells
nvm alias default 20

# Use project-specific version
# Create .nvmrc in project root:
echo "20" > .nvmrc
# Then in that directory:
nvm use
```

**Automatic version switching:**

Add to `~/.bashrc` or `~/.zshrc`:
```bash
# Auto-load .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
```

---

## Contributing

You could fork and create PR if you want.

Thank you!

---

**Last Updated**: 2025-12-20
**Neovim Version**: 0.9.5