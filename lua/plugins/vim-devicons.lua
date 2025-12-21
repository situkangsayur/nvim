return {
  'ryanoasis/vim-devicons',
  lazy = false,
  priority = 1000,
  init = function()
    -- Customize folder/directory icons
    vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
    vim.g.DevIconsEnableFoldersOpenClose = 1
    vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

    -- Add custom file type icons with Nerd Fonts
    vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
      js = '󰌞',
      ts = '󰛦',
      tsx = '󰜈',
      jsx = '󰜈',
      json = '󰘦',
      md = '󰍔',
      vim = '',
      py = '󰌠',
      lua = '󰢱',
      go = '󰟓',
      rs = '󱘗',
      rb = '󰴭',
      java = '󰬷',
      c = '󰙱',
      cpp = '󰙲',
      cs = '󰌛',
      php = '󰌟',
      swift = '󰛥',
      kt = '󱈙',
      dart = '󰯲',
      html = '󰌝',
      css = '󰌜',
      scss = '󰟬',
      sass = '󰟬',
      less = '󰌜',
      xml = '󰗀',
      yaml = '󰈙',
      yml = '󰈙',
      toml = '󰈙',
      sh = '',
      bash = '',
      zsh = '',
      fish = '',
      sql = '󰆼',
      db = '󰆼',
      sqlite = '󰆼',
      png = '󰋩',
      jpg = '󰋩',
      jpeg = '󰋩',
      gif = '󰋩',
      svg = '󰜡',
      ico = '󰋩',
      webp = '󰋩',
      pdf = '󰈦',
      zip = '󰗄',
      tar = '󰗄',
      gz = '󰗄',
      lock = '󰌾',
      log = '󰌱',
      txt = '󰈙',
      dockerfile = '󰡨',
      makefile = '',
    }

    -- Folder icons with Nerd Fonts
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
