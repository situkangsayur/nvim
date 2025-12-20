return {
  'neoclide/coc.nvim',
  branch = 'release',
  build = 'npm ci',  -- Rebuild on install
  config = function()
    vim.opt.hidden = true
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.cmdheight = 2
    vim.opt.updatetime = 300
    vim.opt.shortmess:append("c")

    if vim.fn.has("nvim-0.5.0") == 1 or vim.fn.has("patch-8.1.1564") == 1 then
      vim.opt.signcolumn = "number"
    else
      vim.opt.signcolumn = "yes"
    end

    -- Key mappings
    local map = vim.keymap.set
    map('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
    map('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
    map('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    map('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    map('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    map('n', 'gr', '<Plug>(coc-references)', { silent = true })

    function _G.show_documentation()
      if vim.bo.filetype == 'vim' or vim.bo.filetype == 'help' then
        vim.cmd('h '..vim.fn.expand('<cword>'))
      elseif vim.fn['coc#rpc#ready']() then
        vim.fn['CocActionAsync']('doHover')
      else
        vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
      end
    end
    map('n', 'K', '<Cmd>lua _G.show_documentation()<CR>', { silent = true })

    map('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
    map('n', '<leader>rf', '<Plug>(coc-refactor)', { silent = true })
    map('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
    map('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
    map('n', '<leader>fa', '<Plug>(coc-codeaction-format)', { silent = true })
    map('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })
    map('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })
    map('n', '<leader>ac', '<Plug>(coc-codeaction)', { silent = true })
    map('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true })

    map('x', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
    map('o', 'if', '<Plug>(coc-funcobj-i)', { silent = true })
    map('x', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
    map('o', 'af', '<Plug>(coc-funcobj-a)', { silent = true })
    map('x', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
    map('o', 'ic', '<Plug>(coc-classobj-i)', { silent = true })
    map('x', 'ac', '<Plug>(coc-classobj-a)', { silent = true })
    map('o', 'ac', '<Plug>(coc-classobj-a)', { silent = true })

    map('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
    map('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

    -- Commands
    vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})
    vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })
    vim.api.nvim_create_user_command('OR', "call CocAction('runCommand', 'editor.action.organizeImport')", {})
    vim.api.nvim_create_user_command('Prettier', "CocCommand prettier.formatFile", {})

    -- Autocmds
    local augroup = vim.api.nvim_create_augroup("mygroup", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = augroup,
      pattern = "*",
      command = "silent call CocActionAsync('highlight')",
    })
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "typescript,json",
      command = "setl formatexpr=CocAction('formatSelected')",
    })
    vim.api.nvim_create_autocmd("User", {
      group = augroup,
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
    })

    -- CoCList mappings
    map('n', '<space>a', ':<C-u>CocList diagnostics<cr>', { silent = true, nowait = true })
    map('n', '<space>e', ':<C-u>CocList extensions<cr>', { silent = true, nowait = true })
    map('n', '<space>c', ':<C-u>CocList commands<cr>', { silent = true, nowait = true })
    map('n', '<space>o', ':<C-u>CocList outline<cr>', { silent = true, nowait = true })
    map('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { silent = true, nowait = true })
    map('n', '<space>j', ':<C-u>CocNext<CR>', { silent = true, nowait = true })
    map('n', '<space>k', ':<C-u>CocPrev<CR>', { silent = true, nowait = true })
    map('n', '<space>p', ':<C-u>CocListResume<CR>', { silent = true, nowait = true })
    
    -- Completion mappings
    -- Define check_back_space as a VimScript function for use in expression mappings
    vim.cmd([[
      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
    ]])

    map('i', '<C-space>', 'coc#refresh()', { silent = true, expr = true })
    map('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>"', { silent = true, expr = true })
    map('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\\<TAB>" : coc#refresh()', { silent = true, expr = true })
    map('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', { silent = true, expr = true })
    map('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\\<TAB>" : coc#refresh()', { silent = true, expr = true })
    map('i', '<C-k>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', { silent = true, expr = true })

    -- Snippet mappings
    map('i', '<C-l>', '<Plug>(coc-snippets-expand-jump)', { silent = true })
    map('v', '<C-j>', '<Plug>(coc-snippets-select)', { silent = true })
    map('i', '<C-;>', '<Plug>(coc-snippets-expand)', { silent = true })
    map('x', '<leader>x', '<Plug>(coc-convert-snippet)', { silent = true })
    vim.g.coc_snippet_next = '<tab>'
  end
}
