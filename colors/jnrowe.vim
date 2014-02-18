" Vim colour file
" Name:       jnrowe.vim
" Maintainer: James Rowe <jnrowe@gmail.com>
" Homepage:   https://github.com/JNRowe/vim-jnrowe
"
" This theme is designed for the GUI, but features a /slightly/ more ugly
" terminal mode for 88 colour terms.
"
" The colours are based around the tango palette for the GUI version, but this
" isn't really a tango theme.  The terminal colours are supposed to be close
" approximations to the GUI settings.
"
" To use a lighter background, :let g:jnrowe_dark = 0
"
" To disable the statusline mode hook, :let jnrowe_mode_statusline = 0

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

if !exists("g:jnrowe_dark")
    let g:jnrowe_dark = 1
endif

if !exists("g:jnrowe_mode_statusline") && !exists("g:loaded_airline")
    let g:jnrowe_mode_statusline = 1
endif

let colors_name = "jnrowe"

" Base colours {{{
highlight Cursor        guibg=#d3d7cf
    \ ctermbg=86
highlight lCursor       guibg=#eeeeec
    \ ctermbg=87
if !g:jnrowe_dark
    highlight NonText   guibg=#555753  guifg=#babdb6
        \ ctermbg=81  ctermfg=85
    highlight Normal    guibg=#454545  guifg=#f4f4f4
        \ ctermbg=80  ctermfg=7
else
    highlight NonText   guibg=#353733  guifg=#babdb6
        \ ctermbg=80  ctermfg=85
    highlight Normal    guibg=#252525  guifg=#f4f4f4
        \ ctermbg=80  ctermfg=85
endif
highlight Visual        guibg=#555753                 gui=bold
    \ ctermbg=81                 cterm=bold
" }}}

" Search {{{
highlight IncSearch     guibg=#fce94f  guifg=#cc0000  gui=italic
    \ ctermbg=87                 cterm=italic
if v:version >= 700
    highlight Matchparen               guifg=#8ae234  gui=bold
        \             ctermfg=47  cterm=bold
endif
highlight Search        guibg=#fce94f  guifg=#a40000  gui=italic
    \ ctermbg=87  ctermfg=48  cterm=italic
" }}}

" Window stuff {{{
highlight CursorColumn  guibg=#888a85
    \ ctermbg=83
highlight CursorLine    guibg=#555753
    \ ctermbg=81
highlight FoldColumn    guibg=#4a4a4a  guifg=#dedede
    \ ctermbg=8   ctermfg=86
highlight Folded        guibg=#8090a0  guifg=#111111
    \ ctermbg=39  ctermfg=8
highlight LineNr        guibg=#222222  guifg=#aaaaaa  gui=italic
    \ ctermbg=80  ctermfg=84  cterm=italic
highlight SignColumn    guibg=#2a2a2a
    \ ctermbg=8
highlight StatusLine    guibg=#4d6884  guifg=#ffffff  gui=bold,underline
    \ ctermbg=43  ctermfg=15  cterm=bold,underline
highlight StatusLineNC  guibg=#263442  guifg=#999999  gui=italic,underline
    \ ctermbg=17  ctermfg=83  cterm=italic,underline
highlight VertSplit     guibg=#a0b0c0  guifg=#a0b0c0
    \ ctermbg=43 ctermfg=43
" }}}

" Command line {{{
highlight ErrorMsg      guibg=#ef2929  guifg=#eeeeec  gui=undercurl
    \ ctermbg=48  ctermfg=86  cterm=undercurl
highlight WarningMsg                   guifg=#ef2929  gui=italic
    \             ctermfg=48  cterm=italic
" }}}

" Popup menu {{{
if v:version >= 700
    highlight Pmenu     guibg=#555753  guifg=#d3d7cf
        \ ctermbg=81  ctermfg=86
    highlight PmenuSbar guibg=#888a85  guifg=#eeeeec
        \ ctermbg=83  ctermfg=87
    highlight PmenuSel  guibg=#73d216  guifg=#2e3436  gui=italic
        \ ctermbg=44  ctermfg=37  cterm=italic
endif
" }}}

" Specials {{{
highlight Special       guifg=#fd8900
    \             ctermfg=68
highlight Title                        guifg=#ffffff  gui=bold
    \             ctermfg=15  cterm=bold
highlight Todo          guibg=#520000  guifg=#e50808  gui=bold
    \ ctermbg=32  ctermfg=9   cterm=bold
" }}}

" Syntax {{{
highlight Comment       guibg=#555753  guifg=#eeeeec  gui=italic
    \ ctermbg=81  ctermfg=87  cterm=italic
highlight Constant                     guifg=#8ae234
    \             ctermfg=10
highlight Error         guibg=#ef2929  guifg=#eeeeec  gui=undercurl
    \ ctermbg=48  ctermfg=87  cterm=undercurl
highlight Function                     guifg=#ce5c00  gui=bold
    \             ctermfg=56  cterm=bold
highlight Identifier                   guifg=#729fcf  gui=bold
    \             ctermfg=6   cterm=bold
highlight Label                        guifg=#888a85
    \             ctermfg=83
highlight Number                       guifg=#d3d7cf  gui=bold
    \             ctermfg=86  cterm=bold
highlight PreProc                      guifg=#edd400  gui=bold
    \             ctermfg=11  cterm=bold
highlight Statement                    guifg=#f57900  gui=bold
    \             ctermfg=68  cterm=bold
highlight String                       guifg=#edd400
    \             ctermfg=11
highlight Test          guibg=#555753  guifg=#edd400
highlight Type                         guifg=#73d216
    \             ctermfg=44
highlight Warning                      guifg=#ef2929  gui=italic
    \             ctermfg=48  cterm=italic
" }}}

" Hooks {{{
" I realise people don't like this type of thing in colourschemes, but I don't
" care as toggling this correctly is horrendous!
if g:jnrowe_mode_statusline == 1 && version >= 700
    function! s:InsertColour(mode)
        if a:mode == 'i'
            let bg_colour = "#73d216"
            let tbg_colour = "44"
        elseif a:mode == 'r'
            let bg_colour = "#ef2929"
            let tbg_colour = "9"
        else
            let bg_colour = "#f57900"
            let tbg_colour = "68"
        endif
        execute("highlight StatusLine guibg=" . bg_colour . " gui=underline")
        execute("highlight StatusLine ctermbg=" . tbg_colour . " cterm=underline")
    endfunction

    augroup jnrowe_color
    autocmd!
    autocmd InsertEnter,InsertChange * call s:InsertColour(v:insertmode)
    autocmd InsertLeave *
        \ highlight StatusLine guibg=#4d6884  gui=bold,underline
            \ ctermbg=43              cterm=bold,underline
    " When we leave this colourscheme(but we won't!) drop our events so they
    " don't interfere with other colourschemes
    function! s:ScrubEvents()
        if g:colors_name !=# "jnrowe" |
            autocmd! jnrowe_color
        endif
    endfunction
    autocmd ColorScheme * call s:ScrubEvents()
    augroup END
endif
" }}}

