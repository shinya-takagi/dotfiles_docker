vim.cmd [[
try
  " colorscheme nightfox
  colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
