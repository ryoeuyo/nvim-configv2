-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "gopls", "cssls", "ts_ls", "html", "lua_ls", "protols", "zls", "ruby_lsp",
  "rust_analyzer", "ts_ls", "gitlab_ci_ls", "zls", "pyright", "intelephense", "twiggy_language_server" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  arguments = { "-std=gnu++26" },
}

lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    intelephense = {
      format = {
        tabSize = 4,
        useTabs = false,
      }
    }
  }
}
