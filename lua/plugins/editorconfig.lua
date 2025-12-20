return {
  'editorconfig/editorconfig-vim',
  config = function()
    vim.g.EditorConfig_exec_path = '.editorconfig'
    vim.g.EditorConfig_core_mode = 'external_command'
  end
}
