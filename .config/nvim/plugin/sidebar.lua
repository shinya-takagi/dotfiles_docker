local status_ok, sidebar = pcall(require, "sidebar-nvim")
if (not status_ok) then return end

local opts = { open = true }
sidebar.setup(opts)
