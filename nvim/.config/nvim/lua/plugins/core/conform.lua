return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      yaml = { 'yamlfix' },
      python = { 'isort', 'black' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      json = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
    },
    formatters = {
      prettier = {
        -- cwd means "config working directory"
        require_cwd = true,
        cwd = require('conform.util').root_file({
          '.prettierrc',
          '.prettierrc.json',
          '.prettierrc.yml',
          '.prettierrc.yaml',
          '.prettierrc.json5',
          '.prettierrc.js',
          '.prettierrc.cjs',
          '.prettierrc.mjs',
          '.prettierrc.toml',
          'prettier.config.js',
          'prettier.config.cjs',
          'prettier.config.mjs',
        }),
      },
      yamlfix = {
        env = {
          YAMLFIX_SEQUENCE_STYLE = 'block_style',
          YAMLFIX_WHITELINES = '1',
          YAMLFIX_LINE_LENGTH = '120',
        },
      },
    },
  },
}
