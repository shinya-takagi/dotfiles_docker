local status_ok, sidebar = pcall(require, "sidebar-nvim")
if (not status_ok) then return end

local opts = {
  open = false,
  bindings = {
    ['q'] = function() sidebar.close() end
  },
}
sidebar.setup(opts)

local keymap = vim.api.nvim_set_keymap
local opts_keymap = { noremap = true, silent = true }
keymap('n', '<leader>st', ':SidebarNvimToggle<CR>', opts_keymap)
