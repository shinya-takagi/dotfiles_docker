"-----------------------------------------------------------
"         Plugin Manager
"-----------------------------------------------------------
" Define 'is_plugged' function.
function s:is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction

" Plugin Manager : Vim-Plug(https://github.com/junegunn/vim-plug)
call plug#begin()
"-----Language server neovim and completion ----->
    " nvim-cmp(https://github.com/hrsh7th/nvim-cmp)-----> 
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'ray-x/lsp_signature.nvim'         " Show signature help on function
    Plug 'folke/lsp-colors.nvim'            " Add lsp colors
    Plug 'kkharji/lspsaga.nvim'             " Lsp helper?
    Plug 'folke/trouble.nvim'               " Show warning/error like vscode
    " nvim-treesitter supports various syntax highlights.
    "   Require neovim-nightly or nvim7.0 over
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ray-x/cmp-treesitter'             " cmp for treesitter
    " Add 2022.07.02.
    Plug 'onsails/lspkind.nvim'             " Show icons in completion on lsp
    Plug 'dhruvasagar/vim-table-mode'       " Create table in vim built-in.
    " For Python
    Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
    Plug 'pixelneo/vim-python-docstring'    " Auto python docstring
    " Add 2022.07.05.
    Plug 'windwp/nvim-autopairs'            " Autocomplete pairs
    Plug 'nvim-treesitter/playground'       " Show treesitter background
    Plug 'zbirenbaum/neodim'                " highlight unuse variables
    " For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    " For LaTeX
    Plug 'lervag/vimtex'
    " Airline
    Plug 'nvim-lualine/lualine.nvim'        " Powerline fonts for neovim
    Plug 'kyazdani42/nvim-web-devicons'     " Various icons for neovim
    " Filer
    Plug 'kyazdani42/nvim-tree.lua'         " Neovim tree
    " Fuzzy Finder
    Plug 'nvim-lua/plenary.nvim'            " Neovim api
    Plug 'nvim-telescope/telescope.nvim'    " lua made in fuzzy finder
    Plug 'RRethy/vim-illuminate'            " Illuminate same variables
    Plug 'SmiteshP/nvim-navic'              " Show function name.
    Plug 'simrat39/symbols-outline.nvim'    " Show Symbol at outline
" --- adjust treesitter colorscheme---->
    Plug 'tanvirtin/monokai.nvim'
"   Plug 'Th3Whit3Wolf/one-nvim'
"   Plug 'Th3Whit3Wolf/space-nvim'
"   Plug 'nekonako/xresources-nvim'
"   Plug 'EdenEast/nightfox.nvim' " Vim-Plug
"   Plug 'yonlu/omni.vim'
"-----Fuzzy Finder---<

" -----Plugin Deprecated -------->
    " ----Language server for vim 'vim-lsp'----->
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'mattn/vim-lsp-settings'
    " ----Vim Airline----->
    " Plug 'vim-airline/vim-airline'          " Powerline fonts for Vim 
    " Plug 'vim-airline/vim-airline-themes'   " For Airline themes
    " Plug 'ryanoasis/vim-devicons'           " Various icons for Vim.
    " Plug 'lambdalisue/fern.vim'             " Filer
    " Plug 'antoinemadec/FixCursorHold.nvim'
    " Plug '/usr/bin/fzf'
    " Plug 'junegunn/fzf'     
" ------------------------<

call plug#end()
set completeopt=menu,menuone,noselect
"-----Colorscheme----->
"colorscheme ThemerVim          " Original colorscheme
 colorscheme monokai
"-----Colorscheme-----<
"
"----Fern setting----->
if s:is_plugged("fern.vim")
    nmap <C-N> :Fern . -drawer<CR>
endif
" if s:is_plugged("telescope.nvim")
"     nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"     nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"     nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"     nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" endif

" Lspsaga config
  " Show preview definition 
nnoremap <silent> gd :Lspsaga preview_definition<CR>
"  show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
"  lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"  show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"  rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

"------ vim-airline commands ----------------->
if s:is_plugged("vim-airline")
    let g:airline_powerline_fonts = 1               " Use Powerline fonts
    let g:airline#extensions#tabline#enabled = 1    " Show tab line at opening files
    "let g:airline_theme = 'powerlineish'           " Change Airline color theme
    let g:airline_theme = 'molokai'                 " Change Airline color theme
    if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif
"   let g:airline_left_sep = '⮀'                    " Separeter for left
"   let g:airline_left_alt_sep = '⮁'
"   let g:airline_right_sep = '⮂'                   " Separater for right
"   let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.crypt = '🔒'              " Encrypted files(read only)
"   let g:airline_symbols.linenr = '¶'              " Line
    let g:airline_symbols.linenr = 'LINE'           " Line
    let g:airline_symbols.maxlinenr = 'MAX㏑'       " Max Line
    let g:airline_symbols.branch = '⭠'              " Git Branch
    let g:airline_symbols.paste = 'ρ'               " Paste Mode
    let g:airline_symbols.spell = 'Ꞩ'               " Spell Check
    let g:airline_symbols.notexists = '∄'           " If it is not managed by Git
    let g:airline_symbols.whitespace = 'Ξ'          " Warnig over Space
endif

"=====================================================>
"       Lua script
"=====================================================>
" Syntax highlight with nvim-treesitter
lua <<EOF
    require'nvim-treesitter.configs'.setup{
        -- ensure_installed = {"cpp", "markdown", "make"},
        highlight = {
            enable = true,
            disable = {
                'ruby',
            }
        },
    }
EOF

" Language server of init.lua
"-----Setup nvim-cmp----------->
lua <<EOF
  -- Setup nvim-cmp.
  local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        opts.on_attach = function(client,buffer_number)
          print(vim.inspect(client))
          print(buffer_number)
        end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
        -- vim.cmd [[ do User LspAttachBuffers ]]
    end)
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end


  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'treesitter' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  local lspkind = require('lspkind')
  cmp.setup {
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          return vim_item
        end
      })
    }
  }
  -- LuaLine setting
    local lualine = require('lualine')
    lualine.setup{
        options = {
            theme = 'powerline_dark'
            --theme = 'molokai'
        },
    }
  -- nvim-autopairs setting
    local autopairs = require("nvim-autopairs")
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    -- local cmp = require('cmp')
    autopairs.setup{
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
    }

    -- Setup neodim
    local neodim = require("neodim")
    neodim.setup({
        alpha = 0.8
        }
    )

    -- Setup nvimtree
    local ntree = require("nvim-tree")
        ntree.setup({
    })

    -- Setup lsp_signature
    local signature = require("lsp_signature")
    local cfg = {}
    signature.setup(cfg)
    signature.on_attach()

    -- Setup trouble.nvim
    require("trouble").setup{
        -- here is your configuration.
    }
    -- Show trouble on Shift+t.
    vim.api.nvim_set_keymap('n', '<S-t>', '<cmd>TroubleToggle<CR>', { noremap = true})

    lspconfig = require("lspconfig")
    lspconfig["fortls"].setup{
--      root_dir = lspconfig.util.root_pattern("~/.local/bin/fortls")
    }

EOF
