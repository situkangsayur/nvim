return {
  'ryanoasis/vim-devicons',
  config = function()
    -- Customize folder/directory icons
    vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
    vim.g.DevIconsEnableFoldersOpenClose = 1
    vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

    -- Add custom file type icons
    vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
      js = '',
      ts = '',
      tsx = '',
      jsx = '',
      json = '',
      md = '',
      vim = '',
      py = '',
      lua = '',
      go = '',
      rs = '',
      html = '',
      css = '',
      scss = '',
      sh = '',
      yml = '',
      yaml = '',
      toml = '',
      xml = '',
      sql = '',
      git = '',
      png = '',
      jpg = '',
      jpeg = '',
      svg = '',
      pdf = '',
      zip = '',
      tar = '',
      lock = '',
    }

    -- Custom exact filename icons
    vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols = {
      ['package.json'] = '',
      ['Dockerfile'] = '',
      ['Makefile'] = '',
      ['README.md'] = '',
      ['LICENSE'] = '',
      ['.gitignore'] = '',
      ['.env'] = '',
    }

    -- Folder icons
    vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
    vim.g.DevIconsDefaultFolderOpenSymbol = ''

    -- Enable file node glyph decorations for NERDTree
    vim.g.webdevicons_enable_nerdtree = 1

    -- Enable folder/directory glyph flag (disabled by default with 0)
    vim.g.WebDevIconsNerdTreeAfterGlyphPadding = ' '

    -- Force extra padding in NERDTree so that the filetype icons line up vertically
    vim.g.WebDevIconsNerdTreeGitPluginForceVAlign = 1
  end
}
