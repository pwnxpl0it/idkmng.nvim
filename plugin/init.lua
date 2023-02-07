local idkmng = require("idkmng")

vim.api.nvim_create_user_command('Idkmng', idkmng.initialize, {})
