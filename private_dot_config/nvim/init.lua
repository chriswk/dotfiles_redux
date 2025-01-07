require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local default_color_scheme = 'nord'
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

local themes = {
    nord = 'plugins.themes.nord',
    onedark = 'plugins.themes.onedark'
}

-- Setup plugins

require('lazy').setup({
    require(themes[env_var_nvim_theme]),
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.none-ls',
    require 'plugins.lualine',
    require 'plugins.bufferline',
    require 'plugins.neo-tree',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.lazygit',
    require 'plugins.comment',
    require 'plugins.gitsigns',
    require 'plugins.misc',
    require 'plugins.harpoon',
    require 'plugins.aerial',
    require 'plugins.vim-tmux-navigator'
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
        },
    },
})

local function file_exists(file)
    local f = io.open(file, 'r')
    if f then
        f:close()
        return true
    else
        return false
    end
end

local session_file = '.session.vim'

if file_exists(session_file) then
    -- source the session file
    vim.cmd('source ' .. session_file)
end

-- Mode line
-- vim: ts=2 sts=2 sw=2 et

