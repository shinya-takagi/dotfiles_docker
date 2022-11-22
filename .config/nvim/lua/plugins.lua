-- Use functions of vim built-in
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


-- Install plugins
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Common utilities

  -- Colorschemes
  use({ 'tanvirtin/monokai.nvim' })
  use({ "EdenEast/nightfox.nvim" }) -- Color scheme
  use({ 'sainnhe/sonokai' })

  -- Utilities
  use({ 'windwp/nvim-autopairs' }) -- Autocomplete pairs
  use({ 'onsails/lspkind.nvim' }) -- Show icons in completion on lsp
  use({ 'RRethy/vim-illuminate' }) -- Illuminate same variables
  use({ 'SmiteshP/nvim-navic' }) -- Show function name.
  use({ 'simrat39/symbols-outline.nvim' }) -- Show Symbol at outline
  use({ "lukas-reineke/indent-blankline.nvim" }) -- Show indent line blank
  use({ "rcarriga/nvim-notify" }) -- Show Notification popup
  use({ 'ethanholz/nvim-lastplace' }) -- Remember last position when it opened.
  use({ 'hrsh7th/vim-vsnip' }) -- Snipet like VSCode

  -- LSP
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ 'ray-x/lsp_signature.nvim' }) -- Show signature help on function
  use({ 'folke/lsp-colors.nvim' }) -- Add LSP colors
  use({ 'kkharji/lspsaga.nvim' }) -- Lsp helper
  use({ 'folke/trouble.nvim' }) -- Show warning/error like VSCode

  -- Completions
  use({ 'hrsh7th/nvim-cmp' }) -- cmp engine
  use({ 'hrsh7th/cmp-nvim-lsp' }) -- LSP completions
  use({ 'hrsh7th/cmp-buffer' }) -- buffer completions
  use({ 'hrsh7th/cmp-path' }) -- path completions
  use({ 'hrsh7th/cmp-cmdline' }) -- command line completions

  -- Status Line
  use({ 'nvim-lualine/lualine.nvim' }) -- Powerline fonts for neovim
  use({ 'kyazdani42/nvim-web-devicons' }) -- Various icons for neovim

  -- Filer
  use({ 'kyazdani42/nvim-tree.lua' }) -- Neovim tree

  -- Fuzzy Finder
  use({ 'nvim-telescope/telescope.nvim' }) -- lua made in fuzzy finder

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Treesitter Engine
  use({ 'ray-x/cmp-treesitter' })

  -- Screen
  use({ 'goolord/alpha-nvim' }) -- Custom menu

  -- Lua
  use({ "folke/neodev.nvim" }) -- Develop for lua

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
