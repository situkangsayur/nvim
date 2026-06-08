[#](#) Neovim Keymaps Reference

> Auto-generated from config files. Leader key: `,`

## Legenda

### Mode Vim/Neovim

Kolom **Mode** menunjukkan di mode mana keybinding aktif. Vim/Neovim modal —
artinya tombol yang sama bisa berbeda fungsi tergantung mode.

| Kode | Nama Mode | Penjelasan | Cara Masuk |
|------|-----------|------------|------------|
| `n` | **Normal** | Mode default untuk navigasi & menjalankan command. Tombol huruf jadi command (mis. `dd`, `yy`). | Tekan `<Esc>` (atau `jk` di config ini). |
| `i` | **Insert** | Mode mengetik teks seperti editor biasa. | `i`, `a`, `o`, `I`, `A`, `O` dari Normal. |
| `v` | **Visual** | Mode select karakter. | `v` dari Normal. |
| `x` | **Visual (non-Select)** | Sama seperti Visual tapi tidak termasuk Select mode. Sering dipakai untuk mapping yang hanya berlaku saat blok dipilih. | `v` / `V` / `<C-v>` dari Normal. |
| `o` | **Operator-pending** | Mode singkat setelah operator (mis. `d`, `c`, `y`) menunggu motion/text-object berikutnya. | Otomatis setelah operator, mis. setelah menekan `d`. |
| `t` | **Terminal** | Mode aktif saat fokus di dalam `:terminal`. | Otomatis saat masuk terminal buffer. |
| `c` | **Command-line** | Mode mengetik command setelah `:`, `/`, `?`. | `:`, `/`, `?` dari Normal. |
| `s` | **Select** | Mirip Visual tapi mengetik langsung mengganti seleksi (seperti editor GUI). | `gh` / `gH` / `g<C-h>`. |

Beberapa kolom mode di tabel menulis `n/x` atau `x/o` — artinya mapping aktif di
kedua mode tersebut.

### Leader Key

**Leader** adalah tombol prefix yang dapat dikustomisasi sebagai "tombol command
personal". Dipakai supaya banyak shortcut bisa dirangkai tanpa bertabrakan
dengan command bawaan Vim.

- Di config ini leader = **`,`** (koma), didefinisikan di `init.lua:15`
  (`vim.g.mapleader = ','`).
- Notasi `<Leader>` dan `<leader>` di tabel di bawah → **tekan `,` dulu**, lalu
  tombol berikutnya dalam ~1 detik (timeout default `timeoutlen`).
- Contoh: `<Leader>e` = tekan `,` lalu `e` → `:NvimTreeToggle`.
- Contoh: `<Leader>tv` = tekan `,` lalu `t` lalu `v` → buka terminal vertikal.

Catatan: ada juga `<space>...` di beberapa mapping (mis. `<space>e`,
`<space>r`). Ini menggunakan tombol **Space**, bukan leader. Kebetulan dipakai
sebagai prefix sekunder untuk command CoC dan lain-lain.

### Notasi Tombol Lainnya

| Notasi | Artinya |
|--------|---------|
| `<C-x>` | Tekan **Ctrl** + `x` |
| `<S-x>` | Tekan **Shift** + `x` |
| `<A-x>` | Tekan **Alt** + `x` |
| `<CR>` | **Enter** (Carriage Return) |
| `<Esc>` | Tombol **Escape** |
| `<Tab>` / `<S-Tab>` | **Tab** / **Shift+Tab** |
| `<F1>`..`<F12>` | Function keys |
| `<space>` | Tombol **Spasi** |
| `<Plug>(...)` | Mapping internal plugin, biasanya dipakai sebagai target re-map |

---

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
| n | `<Leader>-` | `SmartSplit('horizontal')` | Split horizontal — **tree-aware** (lihat catatan di bawah) |
| n | `<Leader>\` | `SmartSplit('vertical')` | Split vertical — **tree-aware** |
| n | `<Leader>ws` | `SmartSplitPick('horizontal')` | Split horizontal + pilih file via FZF (tree-aware) |
| n | `<Leader>wv` | `SmartSplitPick('vertical')` | Split vertical + pilih file via FZF (tree-aware) |
| n | `<Leader>=` | `<C-w>=` | Equalize split sizes |

> **Catatan split tree-aware:** kalau kursor sedang di window **NvimTree**, `:split`/`:vsplit` polos akan membelah window tree-nya sendiri. `<Leader>-` / `<Leader>\` mendeteksi filetype `NvimTree` lalu memilih sendiri window editor (window non-tree & non-floating pertama di tab), pindah fokus ke sana, dan langsung `split`/`vsplit` **file di posisi kursor** di sana. Sengaja **tidak** memakai `api.node.open.*` karena saat ada 2+ window editor itu memicu prompt _"pick a window"_ nvim-tree; cara manual ini selalu langsung membuat split tanpa bertanya. Tree dibiarkan utuh (folder/link di tree diabaikan, hanya file yang di-split). `<Leader>ws` / `<Leader>wv` lompat dulu ke window editor (`wincmd l`) sebelum split + FZF supaya hasilnya mendarat di area editor. Untuk balik fokus ke tree dari window mana pun pakai `<Leader>wt`. Di luar tree semuanya berperilaku seperti split biasa pada buffer saat ini.
| n | `<C-w>s` | (builtin) | Split horizontal (bawaan Neovim — **kitty intercept `<C-w>` sebagai close-tab**, pakai `<Leader>ws` / `<Leader>-`) |
| n | `<C-w>v` | (builtin) | Split vertical (bawaan Neovim — sama, pakai `<Leader>wv` / `<Leader>\`) |
| n | `<C-w>q` | (builtin) | Close split (bawaan Neovim) |
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
| n | `<Leader>wt` | `:NvimTreeFocus<CR>` | Fokus balik ke tree di kiri (tanpa menutupnya) |

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
| n | `<C-p>` | `:FZFSmart<CR>` | Fuzzy find files (auto: GFiles in git repo, else Files) |
| i | `<C-i>` | `:FZFSmart<CR>` | Fuzzy find files (insert) |
| n | `<C-B>` | `:Buffers<CR>` | FZF buffers |
| n | `<C-L>` | `:Lines<CR>` | FZF lines |
| n | `<Leader>fzl` | `:Lines<CR>` | FZF lines (alt) |
| n | `<Leader>fzb` | `:Buffers<CR>` | FZF buffers (alt) |
| n | `<Leader>fzc` | `:Commits<CR>` | FZF commits |
| n | `<Leader>fzf` | `:Files<CR>` | List all files in cwd (force Files) |

> **Catatan:** `:FZFSmart` mendeteksi apakah cwd berada di dalam git repo.
> Bila ya menggunakan `:GFiles --exclude-standard --others --cached` (menampilkan
> tracked + untracked, mengikuti `.gitignore`). Bila tidak, fallback ke `:Files`
> yang melist semua file di cwd. Ini memperbaiki kasus saat `<C-p>` tidak
> menampilkan list file di luar git repo.

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

## Jupyter — molten (inline) & Iron REPL

Dua jalur menjalankan kode Python di Neovim:

- **molten** (`,j…`) — jalankan **sel** ke kernel Jupyter, output **inline** (teks +
  plot via image.nvim/kitty). Cocok untuk alur notebook. Python host pakai venv
  `~/.local/share/nvim/molten-venv` (lihat `setup.sh`); render gambar butuh
  terminal kitty + ImageMagick.
- **Iron REPL** (`,r…` / `,s…`) — REPL teks ringan di split (kirim baris/blok ke
  ipython). Cocok untuk eksplorasi cepat tanpa kernel.

### molten — sel notebook (output inline)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>ji` | `:MoltenInit` | Init kernel Jupyter untuk buffer ini |
| n | `<leader>jl` | `:MoltenEvaluateLine` | Eval baris saat ini |
| n | `<leader>je` | `:MoltenEvaluateOperator` | Eval lewat operator (mis. `,jeip` = paragraf) |
| x | `<leader>j` | `:MoltenEvaluateVisual` | Eval teks terseleksi |
| n | `<leader>jc` | `:MoltenReevaluateCell` | Re-eval sel saat ini |
| n | `<leader>jd` | `:MoltenDelete` | Hapus sel (beserta output-nya) |
| n | `<leader>jo` | `:MoltenEnterOutput` | Masuk ke window output |
| n | `<leader>jh` | `:MoltenHideOutput` | Sembunyikan output |
| n | `<leader>js` | `:MoltenShowOutput` | Tampilkan output |
| n | `<leader>jr` | `:MoltenRestart!` | Restart kernel |
| n | `<leader>jx` | `:MoltenInterrupt` | Interrupt eksekusi |
| n | `<leader>jI` | `:MoltenImportOutput` | Import output dari `.ipynb` |
| n | `<leader>jE` | `:MoltenExportOutput` | Export output ke `.ipynb` |

### Iron REPL — REPL teks

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

## Code Outline — Atribut, Method & Function

Untuk menganalisis daftar class / atribut / method / function dari file, ada 3 cara
(panel muncul di **sisi kanan**). Semuanya masih tersedia:

| Mode | Key | Action | Sumber | Catatan |
|------|-----|--------|--------|---------|
| n | `<leader>so` | `:SymbolsOutline` | LSP (coc) | **Rekomendasi** — akurat, hierarkis, ikon per jenis (class/method/field/property/function); ikut semua bahasa yang sudah dikonfigurasi |
| n | `<leader>po` | `:TagbarToggle` | ctags | Gaya lama berbasis Universal Ctags (yang dulu Anda pakai); butuh `ctags` di PATH |
| n | `<space>o` | `:CocList outline` | LSP (coc) | Simbol file aktif sebagai fuzzy list (cepat untuk lompat) |
| n | `<space>s` | `:CocList -I symbols` | LSP (coc) | Cari simbol di **seluruh workspace** |

> Untuk analisis atribut/method/function, pakai `<leader>so` (Symbols Outline) —
> berbasis language server jadi akurat untuk Go/Rust/C++/Python/JS-TS/Java/Kotlin/dst.
> `<leader>po` (Tagbar) tetap ada bila Anda lebih suka alur ctags.

**Internal keymaps (within Symbols Outline window):**

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

## AI Assistants (Claude Code & Gemini)

Dua asisten AI berjalan sebagai CLI di dalam Neovim. Ingat `<leader>` = `,`.

- **Claude Code** (`,k…`) — integrasi penuh ala IDE: sadar buffer & seleksi, bisa
  kirim diff yang Anda terima/tolak langsung di editor.
- **Gemini** (`,g…`) — sidebar CLI Gemini, kirim seleksi sebagai konteks.
- **Switcher panel** (`,a…`) — Claude & Gemini berbagi **satu** panel kanan
  (lebar 0.4); buka salah satu otomatis menutup yang lain supaya tidak menumpuk.

### Switcher panel AI — Claude/Gemini gantian

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>ac` | `AIShow('claude')` | Tampilkan Claude (tutup Gemini) |
| n | `<leader>ag` | `AIShow('gemini')` | Tampilkan Gemini (tutup Claude) |
| n | `<leader>ax` | `AIHide()` | Tutup kedua panel |
| n | `<leader>aa` | pilih via `vim.ui.select` | Pilih panel mana yang ditampilkan |

> `,ac`/`,ag` idempoten: menampilkan tanpa menutup kalau panelnya sudah terbuka.
> Definisinya `_G.AIShow`/`_G.AIHide` di `init.lua`.

### Claude Code — prompting

| Mode | Key | Action | Kapan dipakai |
|------|-----|--------|---------------|
| n | `<leader>kc` | `:ClaudeCode` | Buka/tutup panel Claude — lalu **ketik prompt** di panelnya |
| n | `<leader>kf` | `:ClaudeCodeFocus` | Pindah kursor ke panel Claude untuk mengetik |
| n | `<leader>kr` | `:ClaudeCode --resume` | Lanjutkan salah satu sesi lama (pilih dari daftar) |
| n | `<leader>kC` | `:ClaudeCode --continue` | Lanjutkan sesi terakhir langsung |
| n | `<leader>km` | `:ClaudeCodeSelectModel` | Ganti model Claude lalu buka panel |
| n | `<leader>kb` | `:ClaudeCodeAdd %` | Masukkan **buffer aktif** ke konteks prompt |
| x | `<leader>ks` | `:ClaudeCodeSend` | Kirim **teks terseleksi** sebagai konteks prompt |
| n | `<leader>ky` | `:ClaudeCodeDiffAccept` | Terima perubahan/diff yang diajukan Claude |
| n | `<leader>kn` | `:ClaudeCodeDiffDeny` | Tolak perubahan/diff yang diajukan Claude |

**Alur prompting Claude:**
1. (Opsional) seleksi kode di visual mode → `,ks`, atau `,kb` untuk seluruh file,
   sebagai konteks.
2. `,kc` untuk membuka panel (atau `,kf` untuk fokus) lalu ketik instruksi Anda.
3. Bila Claude mengajukan edit, file terbuka sebagai diff → `,ky` menerima,
   `,kn` menolak.
4. `,kr` / `,kC` untuk menyambung percakapan sebelumnya.

### Gemini — prompting

| Mode | Key | Action | Kapan dipakai |
|------|-----|--------|---------------|
| n | `<leader>gg` | `:GeminiToggle` | Buka/tutup sidebar Gemini — lalu **ketik prompt** di sidebar |
| n | `<leader>gc` | `:GeminiSwitchToCli` | Spawn / pindah ke sesi CLI AI |
| x | `<leader>gS` | `:'<,'>GeminiSend` | Kirim **seleksi** ke Gemini sebagai konteks |

**Alur prompting Gemini:**
1. `,gg` membuka sidebar; ketik instruksi langsung di sana.
2. Untuk menyertakan kode: seleksi di visual mode → `,gS` (huruf besar S).
3. `,gc` untuk berpindah/menjalankan sesi CLI bila perlu.

> Catatan: kedua tool dijalankan dari CLI (`claude` & `gemini`) yang harus ada di
> PATH. Di dalam panel/terminal AI, keluar ke normal mode dengan `<Esc>` atau `jk`.

---

## Konflik Keymap yang Diketahui

| Key | Konflik | Catatan |
|-----|---------|---------|
| `<C-s>` | `init.lua` → save (`:w<CR>`) **vs** `barbar.lua` → `:BufferPick` | Karena `barbar` di-load setelah `init.lua`, kemungkinan `<C-s>` akhirnya melakukan `BufferPick`, bukan save. Gunakan `:w<CR>` manual atau remap salah satu. |
| `<C-l>` | `init.lua` → pindah split kanan **vs** CoC → expand/jump snippet (insert mode) | Tidak konflik karena mode berbeda (normal vs insert). |
| `<leader>f` | CoC → format **vs** nvim-metals → format | Sama-sama format, tidak masalah fungsional. |
| `<leader>rn` | CoC → rename **vs** nvim-metals → rename | Sama-sama rename, tidak masalah fungsional. |
| `<space>e` | `init.lua` → buka `$MYVIMRC` **vs** CoC → `:CocList extensions` | Yang dieksekusi belakangan akan menang (cek `:verbose nmap <space>e`). |

## Tips Troubleshooting

- Untuk memeriksa keymap aktif: `:verbose nmap <key>` (normal), `:verbose imap <key>` (insert).
- Untuk reload config setelah edit: tekan `<space>r`.
- Bila `<C-p>` tidak menampilkan file: pastikan plugin `fzf` ter-install (`:Lazy sync`) dan biner `fzf` ada di PATH.