--- Keymaps from https://github.com/hendrikmi/dotfiles

-- Leader key is space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Default to not allowing remaps and silencing output from command from keybinding
local opts = { noremap = true, silent = true }

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Save file but don't auto-format (Leader save normal)
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- Delete single char without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

--Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical :resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical :resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts)

-- Increment/decrement numbers with <leader>+ / <leader>- in addition to Ctrl+a / Ctrl + x
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Windows
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- Split vertical
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- Split horizontal
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Make split equal width and height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- Close current split

-- Navigate between splits with hjkl keys
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab (tab open mnemonic)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- Close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) -- Tab next mnnemonic
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) -- Tab previous mnemonic

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode when indenting in visual
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down with Alt + j / Alt + k
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)

-- Keep last yanked when pasting over marked text
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics

local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
      vim.diagnostic.enable(0)
  else
      vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

