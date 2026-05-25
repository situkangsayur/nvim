#!/usr/bin/env bash
# Neovim configuration setup — Linux & macOS
#
# Installs Neovim (>= 0.10), Node.js, and every language server used by this
# config's coc.nvim setup: Go, Rust, C/C++, Python, JS/TS, Java, Kotlin,
# HTML/CSS, JSON. Safe to re-run (idempotent).
#
# Usage:  ./setup.sh

set -uo pipefail

# ----------------------------------------------------------------------------
# helpers
# ----------------------------------------------------------------------------
c_blue='\033[1;34m'; c_green='\033[1;32m'; c_yellow='\033[1;33m'; c_red='\033[1;31m'; c_reset='\033[0m'
info()  { printf "${c_blue}==>${c_reset} %s\n" "$*"; }
ok()    { printf "${c_green}  ✓${c_reset} %s\n" "$*"; }
warn()  { printf "${c_yellow}  !${c_reset} %s\n" "$*"; }
err()   { printf "${c_red}  ✗${c_reset} %s\n" "$*" >&2; }
have()  { command -v "$1" >/dev/null 2>&1; }

# ----------------------------------------------------------------------------
# detect platform
# ----------------------------------------------------------------------------
case "$(uname -s)" in
  Linux*)  OS="linux" ;;
  Darwin*) OS="macos" ;;
  *) err "Unsupported OS: $(uname -s)"; exit 1 ;;
esac
case "$(uname -m)" in
  x86_64|amd64)  ARCH="x86_64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *) err "Unsupported arch: $(uname -m)"; exit 1 ;;
esac
info "Platform: $OS/$ARCH"

mkdir -p "$HOME/.local/bin"
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

# Package-manager install (best effort, used for a few system tools).
pm_install() { # pm_install <macos-brew-formula> <linux-apt-package>
  if [[ "$OS" == "macos" ]]; then
    have brew && brew list "$1" >/dev/null 2>&1 || brew install "$1"
  else
    if have apt-get; then sudo apt-get install -y "$2"; else warn "install '$2' manually (no apt-get)"; fi
  fi
}

# ----------------------------------------------------------------------------
# 1. Neovim >= 0.10
# ----------------------------------------------------------------------------
nvim_ok() {
  have nvim || return 1
  local v; v="$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+' | head -1)"
  local maj="${v%%.*}" min="${v##*.}"
  (( maj > 0 || (maj == 0 && min >= 10) ))
}
info "Neovim (>= 0.10)"
if nvim_ok; then
  ok "Neovim present: $(nvim --version | head -1)"
elif [[ "$OS" == "macos" ]]; then
  have brew || { err "Install Homebrew first: https://brew.sh"; exit 1; }
  brew install neovim && ok "Neovim installed via brew"
else
  # Linux: official prebuilt tarball into ~/.local (no sudo, beats stale apt 0.9.x)
  tarball="nvim-linux-${ARCH}.tar.gz"
  url="https://github.com/neovim/neovim/releases/latest/download/${tarball}"
  info "Downloading $tarball ..."
  tmp="$(mktemp -d)"
  if curl -fsSL -o "$tmp/$tarball" "$url"; then
    rm -rf "$HOME/.local/nvim-linux-${ARCH}"
    tar -xzf "$tmp/$tarball" -C "$HOME/.local/"
    ln -sf "$HOME/.local/nvim-linux-${ARCH}/bin/nvim" "$HOME/.local/bin/nvim"
    hash -r 2>/dev/null || true
    ok "Neovim installed: $(nvim --version | head -1)"
  else
    err "Failed to download Neovim tarball"; exit 1
  fi
  rm -rf "$tmp"
fi

# ----------------------------------------------------------------------------
# 2. Node.js + npm (required by coc.nvim and several language extensions)
# ----------------------------------------------------------------------------
info "Node.js"
if have node; then
  ok "Node present: $(node --version)"
elif [[ "$OS" == "macos" ]]; then
  brew install node && ok "Node installed via brew"
else
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs
fi

# ----------------------------------------------------------------------------
# 3. Search/picker tools used by the config (fzf, ripgrep)
# ----------------------------------------------------------------------------
info "fzf + ripgrep"
have fzf || pm_install fzf fzf
have rg  || pm_install ripgrep ripgrep
have fzf && ok "fzf $(fzf --version 2>/dev/null | awk '{print $1}')"
have rg  && ok "ripgrep $(rg --version 2>/dev/null | head -1 | awk '{print $2}')"

# ----------------------------------------------------------------------------
# 4. Go + gopls   (coc-go manages gopls; we make sure the binary exists)
# ----------------------------------------------------------------------------
info "Go / gopls"
if have go; then
  if ! have gopls && [[ ! -x "$(go env GOPATH)/bin/gopls" ]]; then
    GO111MODULE=on go install golang.org/x/tools/gopls@latest && ok "gopls installed"
  else
    ok "gopls present"
  fi
  warn "ensure '$(go env GOPATH)/bin' is on PATH for gopls"
else
  warn "Go not installed — skip gopls (install Go from https://go.dev/dl to enable)"
fi

# ----------------------------------------------------------------------------
# 5. Rust + rust-analyzer
# ----------------------------------------------------------------------------
info "Rust / rust-analyzer"
if ! have rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env" 2>/dev/null || true
fi
if have rustup; then
  rustup component list --installed 2>/dev/null | grep -q rust-analyzer || rustup component add rust-analyzer
  ok "rust-analyzer present"
else
  warn "rustup unavailable — skip rust-analyzer"
fi

# ----------------------------------------------------------------------------
# 6. Java (JDK 17+) — coc-java bundles the jdt.ls server itself
# ----------------------------------------------------------------------------
info "Java (JDK 17+ for coc-java)"
if have java; then
  ok "Java present: $(java -version 2>&1 | head -1)"
else
  if [[ "$OS" == "macos" ]]; then brew install openjdk@21; else pm_install openjdk-21-jdk openjdk-21-jdk; fi
fi

# ----------------------------------------------------------------------------
# 7. Kotlin language server  (wired directly via coc-settings.json languageserver
#    block; needs this binary on the system. Install 'gradle' too if your Kotlin
#    projects resolve dependencies via Gradle — the server otherwise falls back to Maven.)
# ----------------------------------------------------------------------------
info "kotlin-language-server"
if have kotlin-language-server; then
  ok "kotlin-language-server present"
elif [[ "$OS" == "macos" ]]; then
  brew install kotlin-language-server && ok "installed via brew"
else
  # Linux: official prebuilt server.zip from fwcd/kotlin-language-server
  if have unzip; then
    tmp="$(mktemp -d)"
    url="https://github.com/fwcd/kotlin-language-server/releases/latest/download/server.zip"
    info "Downloading kotlin-language-server ..."
    if curl -fsSL -o "$tmp/server.zip" "$url"; then
      rm -rf "$HOME/.local/kotlin-language-server"
      unzip -q "$tmp/server.zip" -d "$HOME/.local/kotlin-language-server"
      ln -sf "$HOME/.local/kotlin-language-server/server/bin/kotlin-language-server" "$HOME/.local/bin/kotlin-language-server"
      ok "kotlin-language-server installed to ~/.local"
    else
      warn "Failed to download kotlin-language-server"
    fi
    rm -rf "$tmp"
  else
    warn "'unzip' missing — install it then re-run for Kotlin support"
  fi
fi

# ----------------------------------------------------------------------------
# 8. Python tooling (pyright is bundled in coc-pyright; add black for format)
# ----------------------------------------------------------------------------
info "Python (black formatter)"
if have python3; then
  python3 -m pip install --user --quiet --upgrade black 2>/dev/null && ok "black installed" || warn "could not install black (optional)"
else
  warn "python3 not found — skip black (optional)"
fi

# ----------------------------------------------------------------------------
# 9. Symlink this repo to ~/.config/nvim (if running from elsewhere)
# ----------------------------------------------------------------------------
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ "$SCRIPT_DIR" != "$NVIM_CONFIG_DIR" ]]; then
  if [[ -e "$NVIM_CONFIG_DIR" ]]; then
    warn "$NVIM_CONFIG_DIR exists — not touching it. To use this repo:"
    warn "  mv $NVIM_CONFIG_DIR ${NVIM_CONFIG_DIR}.bak && ln -s $SCRIPT_DIR $NVIM_CONFIG_DIR"
  else
    mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"
    ln -s "$SCRIPT_DIR" "$NVIM_CONFIG_DIR" && ok "linked $SCRIPT_DIR -> $NVIM_CONFIG_DIR"
  fi
fi

# ----------------------------------------------------------------------------
# 10. coc.nvim extensions (deterministic install via npm)
# ----------------------------------------------------------------------------
info "coc.nvim extensions"
COC_EXT_DIR="$HOME/.config/coc/extensions"
mkdir -p "$COC_EXT_DIR"
cat > "$COC_EXT_DIR/package.json" <<'JSON'
{
  "dependencies": {
    "coc-json": ">=1.9.3",
    "coc-tsserver": ">=2.3.1",
    "coc-html": ">=1.4.0",
    "coc-css": ">=1.4.0",
    "coc-pyright": ">=1.1.400",
    "coc-java": ">=1.26.1",
    "coc-go": ">=1.3.35",
    "coc-rust-analyzer": ">=0.86.0",
    "coc-clangd": ">=0.27.0",
    "coc-snippets": ">=3.1.0",
    "coc-prettier": ">=9.4.0"
  }
}
JSON
( cd "$COC_EXT_DIR" && npm install --no-package-lock --legacy-peer-deps --no-audit --no-fund ) \
  && ok "coc extensions installed" || warn "coc extension install had warnings"

# ----------------------------------------------------------------------------
# 11. Bootstrap lazy.nvim plugins, then fetch clangd via coc-clangd
# ----------------------------------------------------------------------------
info "Syncing Neovim plugins (lazy.nvim) ..."
nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1 && ok "plugins synced" || warn "plugin sync reported issues"

info "Installing clangd (C/C++) via coc-clangd ..."
if have clangd; then
  ok "clangd present: $(clangd --version 2>/dev/null | head -1)"
else
  nvim --headless "+CocCommand clangd.install" "+sleep 45" +qa >/dev/null 2>&1 || true
  ok "clangd will be fetched by coc-clangd (first time you open a C/C++ file if not yet)"
fi

# ----------------------------------------------------------------------------
echo
info "Done. Open nvim and run :checkhealth and :CocList extensions to verify."
echo   "  Languages wired: Go, Rust, C/C++, Python, JS/TS, Java, Kotlin, HTML, CSS, JSON"
echo   "  If 'nvim' still resolves to an old version, open a new terminal (PATH cache)."
