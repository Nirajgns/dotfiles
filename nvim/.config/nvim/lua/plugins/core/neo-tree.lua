--Autocmd to open neotree on session load
vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistenceLoadPost',
  callback = function()
    vim.defer_fn(function()
      -- Snacks.explorer.reveal()
      vim.cmd('Neotree show')
    end, 100)
  end,
})

return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- "3rd/image.nvim",  --requires luarocks
    {
      's1n7ax/nvim-window-picker',
      name = 'window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup({ hint = 'floating-big-letter' })
      end,
    },
  },
  cmd = 'Neotree',

  opts = {
    open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf', 'overseer', 'nvterm' },
    popup_border_style = 'rounded',
    default_component_configs = {
      indent = {
        padding = 1,
        -- with_markers = false,
        indent_marker = '│',
        expander_collapsed = '│', --"▶",
        expander_expanded = '├', --"◢",
        last_indent_marker = '╰',
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      commands = {
        --over ride delete visual to use trash instead of rm
        delete_visual = function(state, selected_nodes)
          local inputs = require('neo-tree.ui.inputs')
          local msg = 'Trash ' .. #selected_nodes .. ' itmes ?'

          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end
            for _, node in ipairs(selected_nodes) do
              vim.fn.system({ 'trash', vim.fn.fnameescape(node.path) })
            end

            require('neo-tree.sources.manager').refresh(state.name)
          end)
        end,

        -- Override delete to use trash instead of rm
        delete = function(state)
          local inputs = require('neo-tree.ui.inputs')
          local node = state.tree:get_node()
          local path = node.path
          local pretty_path = vim.fn.fnamemodify(path, ':.') -- Convert to relative path from cwd
          local msg = 'Trash ' .. pretty_path .. ' ?'
          inputs.confirm(msg, function(confirmed)
            if not confirmed then
              return
            end
            vim.fn.system({
              'trash',
              vim.fn.fnameescape(path),
            })
            require('neo-tree.sources.manager').refresh(state.name)
          end)
        end,

        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()

          -- Detect OS
          local uname = vim.loop.os_uname().sysname

          if uname == 'Darwin' then
            -- macOS: open file in default application
            vim.fn.jobstart({ 'open', path }, { detach = true })
          elseif uname == 'Linux' then
            -- Linux: open file in default application
            vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
          elseif uname:match('Windows') then
            -- Windows: Open folder in Explorer
            local p
            local lastSlashIndex = path:match('^.+()\\[^\\]*$') -- Match the last backslash
            if lastSlashIndex then
              p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last backslash
            else
              p = path -- If no backslash found, return original path
            end
            vim.cmd('silent !start explorer ' .. p)
          end
        end,
      },
    },
    window = {
      width = 35,
      popup = { -- settings that apply to float position only
        size = { height = '43', width = '90' },
        position = '50%', -- 50% means center it
      },

      mappings = {
        ['<S-CR>'] = 'open_with_window_picker',
        ['O'] = 'system_open',
        ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
        ['a'] = {
          'add',
          config = {
            show_path = 'relative', -- "none", "relative", "absolute"
          },
        },
      },
    },
    sources = {
      'filesystem',
      'buffers',
      'git_status',
      'document_symbols',
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute({ toggle = true, reveal = true, dir = LazyVim.root() })
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
  },
}
