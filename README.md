# Idkmng.nvim
A Neovim plugin for [idkmng](https://github.com/pwnxpl0it/idkmng).

Making it even better and easier by initializing projects inside Neovim.

## Installation
Make sure you have [idkmng](https://github.com/pwnxpl0it/idkmng) installed on your machine.  <!--TODO autoinstall idkmng-->
<br>

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "pwnxpl0it/idkmng.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
}
```

<br>

using [packer.nvim](https://github.com/wbthomason/packer.nvim) 

```lua
use {"pwnxpl0it/idkmng.nvim",
    requires={"nvim-telescope/telescope.nvim"}
}
```
Then run :
```
:PackerInstall
```

now you should be able to run `:Idkmng`

## Configuration
See `:help idkmng`

Right now idkmng.nvim only takes the theme of Telescope picker, more information can be found [here](https://github.com/nvim-telescope/telescope.nvim#themes) 
Example:

```lua
require("idkmng").setup({
    --default telescope theme
    theme = require("telescope.themes").get_dropdown {} -- https://github.com/nvim-telescope/telescope.nvim#themes 
})
```

### Mappings
To use idkmng.nvim you can run `:Idkmng` in neovim,to create a key binding 

```lua
vim.keymap.set("n", "<leader>i",":Idkmng<CR>")
```
