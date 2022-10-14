"---------------------------------------------------------->
"               Auto command
"---------------------------------------------------------->
augroup autoexe
    autocmd!
    autocmd FileType python nmap <buffer> <F5> :!python %<CR>
    autocmd FileType fortran nmap <buffer> <F5> :DoFortran<CR>
    autocmd FileType cpp nmap <buffer> <F5> :DoCpp<CR>
augroup END
command! DoFortran call s:DoFortran()
command! DoCpp call s:DoCpp()
function! s:DoFortran()
    :!ifort % -o %<
    :!./%<
endfunction
function! s:DoCpp()
    :!icc % -o %<
    :!./%<
endfunction

" Configurate some vim files remotely.
command! -nargs=* -complete=option EditSetting call s:EditSetting(<f-args>)
function! s:EditSetting(arv) abort
    if a:arv == "c"
        :e $HOME/.config/nvim/setting/autocommand.vim
    elseif a:arv == "p"
        :e $HOME/.config/nvim/setting/plugin.vim
    elseif a:arv == "g"
        :e $HOME/.config/nvim/setting/general.vim
    else
        echo "c -> edit automcommand.vim"
        echo "p -> edit plugin.vim"
        echo "g -> edit general.vim"
    endif
endfunction

" =====================================>
"       Original commands
" =====================================>
" Abbreviation of "vertical diffsplit"
function! VerticalDiffSplit(filename)
    execute "vertical diffsplit " a:filename
endfunction
function! DiffSplit(filename)
    execute "diffsplit " a:filename
endfunction
command! -complete=file -nargs=1 VDS :call VerticalDiffSplit(<f-args>)
command! -complete=file -nargs=1 DS :call DiffSplit(<f-args>)
