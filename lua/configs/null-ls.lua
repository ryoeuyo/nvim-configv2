local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.phpcsfixer.with {
      command = "php-cs-fixer",
      args = { "--rules=@PSR12", "--using-cache=no", "$FILENAME" },
    },
  },
}
