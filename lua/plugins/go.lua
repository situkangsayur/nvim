return {
  'fatih/vim-go',
  build = ':GoUpdateBinaries',
  -- Let coc.nvim (coc-go) own ALL LSP features for Go so reference / implementation
  -- / hover / definition work like in every other language. vim-go is kept only for
  -- its extra commands (:GoTest, :GoAddTags, :GoFillStruct, ...). Without this,
  -- vim-go runs a second gopls and remaps gd/K, clobbering coc.
  -- Must be set via `init` (before vim-go's ftplugin reads them).
  init = function()
    vim.g.go_gopls_enabled = 0          -- don't start vim-go's own gopls
    vim.g.go_code_completion_enabled = 0 -- coc handles completion
    vim.g.go_diagnostics_enabled = 0     -- coc handles diagnostics
    vim.g.go_def_mapping_enabled = 0     -- keep coc's gd / gy / gi / gr
    vim.g.go_doc_keywordprg_enabled = 0  -- keep coc's K (hover)
    vim.g.go_fmt_autosave = 0            -- coc formats on save
    vim.g.go_imports_autosave = 0
    vim.g.go_mod_fmt_autosave = 0
  end,
}
