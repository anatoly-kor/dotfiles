require("mason").setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        'sumneko_lua',
        'pyright',
        'bashls',
        'dockerls',
        'jsonls',
        'sqlls',
    },
})

require("mason-null-ls").setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
      'flake8',
      'isort',
      'mypy',
      'stylua',
      'jq',
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
