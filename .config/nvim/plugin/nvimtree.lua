-- Setup nvimtree
local status_ok, ntree = pcall(require, "nvim-tree")
if (not status_ok) then return end

ntree.setup({

})
