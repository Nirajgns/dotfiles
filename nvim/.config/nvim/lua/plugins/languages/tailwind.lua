return {
  {
    'laytan/tailwind-sorter.nvim',
    ft = { 'jsx', 'tsx', 'javascriptreact', 'typescriptreact', 'html' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm ci && npm run build',
    config = true,
    opts = {
      on_save_enabled = false, -- If `true`, automatically enables on save sorting.
      on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
      node_path = 'node',
      trim_spaces = false,
    },

    keys = {
      {
        '<leader>Ts',
        function()
          _G.isSorterEnabled = not _G.isSorterEnabled

          if isSorterEnabled then
            vim.cmd('TailwindSortOnSaveToggle')
            vim.cmd('echo \'Tailwind-sorter ENABLED.\'')
          else
            vim.cmd('TailwindSortOnSaveToggle')
            vim.cmd('echo \'Tailwind-sorter DISABLED.\'')
          end
        end,
        desc = 'Toggle Tailwind Sorter',
      },
    },
  },

  {
    'razak17/tailwind-fold.nvim',
    opts = {
      symbol = '󱏿', -- 󱏿
      highlight = {
        fg = '#38BDF8', -- [[ symbol color ]]
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = { 'TailwindFoldToggle' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'javascriptreact', 'typescriptreact', 'php', 'blade' },
    keys = {
      {
        '<leader>Tf',
        ':TailwindFoldToggle<cr>',
        desc = 'Toggle Tailwind Inline Fold',
        silent = true,
      },
    },
  },
}
