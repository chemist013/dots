require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  systemd_lsp = {},
  systemdlint = {},
  shuck = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
