" my .vimrc
"
" Maintener: rohinomiya <rohinomiya@gmail.com>
" Last Change: 2011/08/21 23:18:33.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

no" When started as "evim", evim.vim will already have done these settings.
no"if v:progname =~? "evim"
no"   finish
"endif
"

" --- vundle.vim - �v���O�C���̏W���Ǘ�

" doc/vundle.md
" ��filetype ����xoff�ɂ��āAVundle �̏����̂��Ƃ�ftplugin��indent ��ǂݍ��ނ悤�Ɏw��B

set nocompatible
filetype off

set rtp+=$VIM/runtime/vundle.git/
call vundle#rc('$VIM/runtime/bundle')
  
" original repos on github
Bundle 'ref.vim'
Bundle 'Shougo/vimproc'  
Bundle 'Shougo/vimshell'  
Bundle 'L9'
"Bundle 'smartchr'
Bundle 'mru.vim'
Bundle 'project.vim'
Bundle 'css.vim'
"Bundle '2htmlj'
"Bundle 'autodate.vim'
Bundle 'ZenCoding.vim'
Bundle 'monday'
Bundle 'repeat.vim'
Bundle 'rename.vim'
Bundle 'eregex.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/neocomplcache'
Bundle 'quickrun.vim'
Bundle 'thinca/vim-ref'
Bundle 'vim-ruby/vim-ruby'
Bundle 'bookmarks.vim'
Bundle 'Align'
Bundle 'surround.vim'
Bundle 'EnhCommentify.vim'
Bundle 'copypath.vim'
"Bundle 'rails.vim'

filetype plugin indent on


" ## vimshell {{{
nnoremap <silent> ,vs :<C-u>VimShell<CR>
nnoremap <silent> ,vS :<C-u>VimShellPop<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1
let g:vimshell_enable_auto_slash = 1

"if has('win32') || has('win64')
""         Display user name on Windows.
"        let g:vimshell_prompt = $USERNAME." % "
"else
""         Display user name on Linux.
"        let g:vimshell_prompt = $USER." % "
"        call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
"        call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
"        let g:vimshell_execute_file_list['zip'] = 'zipinfo'
"        call vimshell#set_execute_file('tgz,gz', 'gzcat')
"        call vimshell#set_execute_file('tbz,bz2', 'bzcat')
"endif

"function! g:my_chpwd(args, context)
"        call vimshell#execute('echo "chpwd"')
"endfunction

"function! g:my_emptycmd(cmdline, context)
"        call vimshell#execute('echo "emptycmd"')
"        return a:cmdline
"endfunction

"function! g:my_preprompt(args, context)
"        call vimshell#execute('echo "preprompt"')
"endfunction

"function! g:my_preexec(cmdline, context)
"        call vimshell#execute('echo "preexec"')

"        if a:cmdline =~# '^\s*diff\>'
"                call vimshell#set_syntax('diff')
"        endif
"        return a:cmdline
"endfunction
" }}}

" --- unite.vim - �u�b�N�}�[�N�A�t�@�C���A���� ���ւ̃N�C�b�N�A�N�Z�X

" �y�Q�l�z
" http://d.hatena.ne.jp/ruedap/20110110/vim_unite_plugin
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"
" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1

" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ��p�Z�b�g
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" ���{����͒��ɃJ�[�\���̐F��ύX����
if has('multi_byte_ime') || has('xim')
    " ���{�����ON���̃J�[�\���̐F��ݒ�
    highlight CursorIM guibg=Purple guifg=NONE
endif

"Esc��2�񉟂��Ńn�C���C�g����
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" �r�W���A���x��
set visualbell

" �^�u�y�[�W�̃��C����\��:2�ȏ�^�u�y�[�W������ꍇ�ɕ\��
set showtabline=2

" �X�y�[�X��Tab�Ȃǂ̌����Ȃ�������\��������
"set list
"set listchars=tab:��-,trail:-,eol:?,extends:��,precedes:��,nbsp:%

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start

if has("vms")
   set nobackup		" do not keep a backup file, use versions instead
else
   set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" ����������ł����ނƑ�����
set incsearch		" do incremental searching
"
"���ʂ̓��͎��ɃJ�[�\����Ή����銇�ʂ̏�Ɉ�莞�ԕ\�������� 
set showmatch
set matchtime=3

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" �R�}���h���C���⊮����Ƃ��ɕ⊮����\������
set wildmenu

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
   syntax on
   set hlsearch
endif

filetype indent plugin on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

   " Enable file type detection.
   " Use the default filetype settings, so that mail gets 'tw' set to 72,
   " 'cindent' is on in C files, etc.
   " Also load indent files, to automatically do language-dependent indenting.
   filetype indent plugin on

   " Put these in an autocmd group, so that we can delete them easily.
   augroup vimrcEx
      au!

      " For all text files set 'textwidth' to 78 characters.
      autocmd FileType text setlocal textwidth=78

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      autocmd BufReadPost *
               \ if line("'\"") > 0 && line("'\"") <= line("$") |
               \   exe "normal! g`\"" |
               \ endif

   augroup END

else

   set autoindent		" always set autoindenting on

endif " has("autocmd")
" ====================================================================== 
" Customize for Toru Fukuda
" ====================================================================== 
"�^�C���A�E�g����
":set ttimeoutlen=10

" -------------------
" �^�u�y�[�W�̐؂�ւ���Windows�̂悤��
" CTRL+Tab SHIFT+Tab�ōs���悤��.
" -------------------
if v:version >= 700
  nnoremap <C-Tab>   gt
  nnoremap <C-S-Tab> gT
endif

" -------------------
"http://www.kawaz.jp/pukiwiki/?vim
" �����R�[�h�̎����F��
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"   iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"   iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"   fileencodings���\�z
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"   �萔������
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
" ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
"if has('autocmd')
"  function! AU_ReCheck_FENC()
"    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"      let &fileencoding=&encoding
"    endif
"  endfunction
"  autocmd BufReadPost * call AU_ReCheck_FENC()
"endif

" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac
" ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
if exists('&ambiwidth')
  set ambiwidth=double
endif
"tags
"http://d.hatena.ne.jp/ysano2005/20070212/1171284015
"Ctrl + t"�̑���ɁA"Ctrl + ["�Ń^�O�W�����v����߂��悤�ɂȂ�܂��B"Ctrl + ]"�Ń^�O�W�����v����̂ŁA���̋t�̑����"Ctrl + ["�łł���Β����I
nmap <c-[>  :pop<CR>

"C-v�̋�`�I���ōs���������J�[�\����u����
set virtualedit=block

"���e���ύX���ꂽ�玩���I�ɍēǂݍ���
set autoread

"�����t�@�C�����g�p����ݒ�ɕύX
set complete+=k

"�N���b�v�{�[�h��Windows�ƘA�g
set clipboard=unnamed

" �܂�Ԃ����Ȃ�
set nowrap

"  �����̃X�y�[�X������ڗ�������
" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" -------------------
" http://nanabit.net/blog/2007/11/03/vim-cursorline/
" �J�����g�E�B���h�E�ɂ̂݌r��������
" -------------------
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorcolumn nocursorline
"  autocmd WinEnter,BufRead * set cursorcolumn cursorline
"augroup END

"highlight CursorLine ctermbg=black guibg=black
"highlight CursorColumn ctermbg=black guibg=black

" -------------------
" migemo(g/)
" -------------------
"g?��Migemo�ɂ��g�������Ƀ}�b�v
set migemo

" -------------------
" GREP
" -------------------
" GNU GREP���g��
"let Grep_Path = 'C:\cygwin\bin\grep.exe'
let Fgrep_Path = 'C:\cygwin\bin\grep.exe -F'
let Egrep_Path = 'C:\cygwin\bin\grep.exe -E'
let Grep_Find_Path = 'C:\cygwin\bin\find.exe'
let Grep_Xargs_Path = 'C:\cygwin\bin\xargs.exe'
let Grep_Shell_Quote_Char = '"'

let Grep_Skip_Dirs = '.svn'
let Grep_Skip_Files = '*.bak *~'

"grep��Ɏ����I��cw(QuickFix)"
au QuickfixCmdPost vimgrep cw
" :vimgrep /hogehoge/j *.txt
":helpg[rep] hogehoge
":bufdo vimgrepadd /hogehoge/ %
":windo vimgrepadd /hogehoge/ %
"

" �^�u�y�[�W�̃��x������ɕ\������(2�ȏ�^�u�y�[�W������ꍇ�ɕ\��)
set showtabline=1

" -------------------
" ����
" -------------------
" �������ɍŌ�܂ōs������ŏ��ɖ߂�
set wrapscan
"�C���f���g�̓X�}�[�g�C���f���g
set smartindent
" �������ɑ啶���������𖳎�
set ignorecase
" ����������ɑ啶�����܂܂�Ă���ꍇ�͋�ʂ��Č�������(nosmartcase)
set smartcase

" �S�p�X�y�[�X�����o��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /�@/

" �s�ԍ��\��
set number

" �o�b�N�A�b�v�t�@�C�������f�B���N�g����ݒ�
set backup
set backupdir=$VIM/backup

" �X���b�v�t�@�C���p�̃f�B���N�g��
set swapfile
set directory=$VIM/swap
"
"�^�O�t�@�C��"
set tags=tags

" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
" set wildmenu
" �R�}���h���C����Ԃ��V�F�����ۂ�
set wildmode=list:longest
" �o�b�t�@���ҏW���ł����̑��̃t�@�C�����J����悤��
set hidden
" �O���̃G�f�B�^�ŕҏW���̃t�@�C�����ύX���ꂽ�玩���œǂݒ���
set autoread

"format.vim���g�����߂̐ݒ�
let format_join_spaces = 2
let format_allow_over_tw = 0 
"----------------------------------------------------------------------
"�X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\������
function! GetB()
   let c = matchstr(getline('.'), '.', col('.') - 1)
   let c = iconv(c, &enc, &fenc)
   return String2Hex(c)
endfunction

" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
   let n = a:nr
   let r = ""
   while n
      let r = '0123456789ABCDEF'[n % 16] . r
      let n = n / 16
   endwhile
   return r
endfunc
"
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
   let out = ''
   let ix = 0
   while ix < strlen(a:str)
      let out = out . Nr2Hex(char2nr(a:str[ix]))
      let ix = ix + 1
   endwhile
   return out
endfunc

"�X�e�[�^�X���C���ɕ����R�[�h�Ɖ��s������\������
" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
if winwidth(0) >= 120
   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

"set statusline=%{GetB()}

"Vim�t���̃G�N�X�v���[��(:explore)�ŊȒP�Ƀt�@�C�����J���f�B���N�g�����w��
"
"set browsedir=last	" �O��Ƀt�@�C���u���E�U���g�����f�B���N�g
"set browsedir=buffer	" �o�b�t�@�ŊJ���Ă���t�@�C���̃f�B���N�g��
set browsedir=current	" �J�����g�f�B���N�g��
"set browsedir={path}	" {path} �Ŏw�肳�ꂽ�f�B���N�g��
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" encoding
"----------------------------------------------------------------------
nmap ,U :set encoding=utf-8<CR>
nmap ,E :set encoding=euc-jp<CR>
nmap ,S :set encoding=cp932<CR>

" �����R�[�h�̐ݒ�. 
" ���ɒ[���̕����R�[�h, �t�@�C���̕����R�[�h, �����F�����镶���R�[�h.
set encoding=cp932
"set encoding=utf-8
set fileencoding=cp932
set fileencodings=utf-8,cp932,euc-jp
"set fileencodings=cp932,utf-8,iso-2022-jp,euc-jp

"----------------------------------------------------------------------
" �^�u����������.
highlight tabs ctermbg=green guibg=green
match tabs /\t/

"�X�N���[�����牺�̍s���킩��Ȃ��̂͋C�ɐH��Ȃ����I
set scrolloff=5

"����ɃJ�����g�f�B���N�g�����ړ������Ⴄ���I
au BufEnter Makefile,*.bat,*.c,*.h,*.pl,*.php,*.js,*.css,*.html,*.xml,*.xsl,*.sql,*.vim,*.rb,*.ahk,autohotkey.ini,*.ini execute ":lcd " . expand("%:p:h")

" �O��I�������J�[�\���s�Ɉړ�
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" ���s�R�[�h�̎����F��
set fileformats=dos,unix,mac

"�K�v�ȃ^�O�t�@�C�����w�肷�񂾂�I
" set tags
" from id:secondlife
if has("autochdir")
   set autochdir
   set tags=tags;
else
   set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

" -------------------
" �R�}���h���[�h�ŁAC-x��c-z�ŁA�ҏW���t�@�C���̃p�X��⊮
" -------------------
" expand path
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
" expand file (not ext)
cmap <c-z> <c-r>=expand('%:p:r')<cr>
" -------------------
" �L�[�o�C���h
" -------------------
" map = �S��
" vmap = VISUAL ���[�h

" nmap = �m�[�}�����[�h
nmap <c-j> <esc>

"Space�Ńo�b�t�@�����؂�ւ�
nmap <Space> :bn<CR>

"global mapping�o�b�t�@�؂�ւ�
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>

" �}�����[�h����ESC�Ŕ������Ƃ��� :w ����
imap <ESC> <ESC>:w<CR>

" ���ʂ���͂����玩���I�ɕ����ʂ����
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" ====================================================================== 
" Key map
" ====================================================================== 
" �R�}���h���C���ł̃L�[�o�C���h�� Emacs �X�^�C���ɂ���
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

" --- autodate.vim - �t�@�C���̃^�C���X�^���v�L�q�������I�ɍX�V

let autodate_keyword_pre="Last Change: \*"
let autodate_keyword_post="."
let autodate_format="%Y/%m/%d %H:%M:%S"
let autodate_lines=10


" ====================================================================== 
" surround.vim
" ====================================================================== 
nmap ,( csw(
nmap ,{ csw{
nmap ,[ csw[
nmap ,' csw'
nmap ," csw"
nmap ,% csw%

" ====================================================================== 
" autocomplpop.vim
" ====================================================================== 

"�^�Ȃ玩���|�b�v�A�b�v��vim�N�����Ɏ����ŗL���ɂ͂��܂���B
"g:AutoComplPop_NotEnableAtStartup:

"���̃L�[�������ꂽ�Ƃ��Ɏ����|�b�v�A�b�v���܂��B
"g:AutoComplPop_MapList:

"�����|�b�v�A�b�v���s���Œᕶ���񒷁B
"g:AutoComplPop_MinLength:

"�����|�b�v�A�b�v���s���Œ������񒷁B
"g:AutoComplPop_MaxLength:

"�����|�b�v�A�b�v���Ɏg�p����⊮�R�}���h�B
"g:AutoComplPop_PopupCmd:

"�����|�b�v�A�b�v���ɁA�ꎞ�I�ɂ��̒l��'ignorecase'�I�v�V�����ɓK�p����܂��B 
let g:AutoComplPop_IgnoreCaseOption = 1

"�����|�b�v�A�b�v���ɁA�ꎞ�I�ɂ��̒l��'complete'�I�v�V�����ɓK�p����܂��B
"g:AutoComplPop_CompleteOption:

"autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
"autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
"autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
"autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
"autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'

"�ȉ��̂悤��vimrc�ɐݒ肷��Ƃ������s�ł���悤�ɂȂ�܂��B
"inoremap <expr> <CR> pumvisible() ? <C-Y>\<CR>" : "\<CR>"
" ====================================================================== 
" monday.vim
" ====================================================================== 

"CTRL-A ��8�i���̌v�Z�������Ȃ�
set nrformats-=octal

"
"call s:Add_word_pair('yes', 'no')
"call <SID>Add_word_pair('no', 'yes')

"call <SID>Add_word_pair('true', 'false')
"call <SID>Add_word_pair('false', 'true')

"call <SID>Add_word_pair('protected', 'private')
"call <SID>Add_word_pair('private', 'public')
"call <SID>Add_word_pair('public', 'protected')

"call <SID>Add_word_pair('�@', '�A')

" ====================================================================== 
" CloseTag(CTRL+SHIFT+_�Ń^�O�����)
" ====================================================================== 
:let g:closetag_html_style=1
":let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '
     

" ====================================================================== 
" buftabs.vim
" ====================================================================== 
"�o�b�t�@�^�u�Ƀp�X���ȗ����ăt�@�C�����̂ݕ\������(buftabs.vim)
let g:buftabs_only_basename=1
"�o�b�t�@�^�u���X�e�[�^�X���C�����ɕ\������
let g:buftabs_in_statusline=1
" ====================================================================== 
" Path
" ====================================================================== 

"function! Win32Help(fname, topic) 
  let fname = 'C:\path\to\help\file.help' 
"  if fnamemodify(a:fname,":e")=="chm" 
"    silent! execute "!start hhh " . a:fname . "  " . a:topic
"  elseif fnamemodify(a:fname,":e")=="hlp" 
"    silent! execute "!start winhlp32 -k " . a:topic . "  " . a:fname 
"  endif 
"endfunction 
function! Win32Help(fname, topic) 
"  let fname = 'D:\Dropbox\Tools\ruby\rubymanjp.chm'
  if fnamemodify(a:fname,":e")=="chm" 
    silent! execute "!start hhh " . a:fname . " " . a:topic
  elseif a:fnamemodify(a:fname,":e")=="hlp" 
    silent! execute "!start winhlp32 -k " . a:topic . " " . a:fname 
  endif 
endfunction 
command! -nargs=1 Win32Help call Win32Help(<f-args>) 
"nmap <S-F1> :call Win32Help('D:\Dropbox\Tools\ruby\rubymanjp.chm',expand('<cword>'))<CR>

"�t���p�X���w�肹���ɁA�t�@�C���������Ńt�@�C�����J����悤�ɂ���
set path+=d:\fukuda\tools\scripts

" --- FileType:autohotkey
autocmd FileType autohotkey set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2

" �t�@�C���^�C�v���ƂɎ����t�@�C�����w��
autocmd FileType autohotkey set dictionary+=$VIM\dict\autohotkey.dic

" �V�����t�@�C�������Ƃ��ɃX�P���g��(�e���v���[�g)�t�@�C����ǂݍ���
autocmd BufNewFile *.ahk	0r $VIM/templates/template.ahk

" HTML�w���v��\��
autocmd FileType autohotkey nmap <S-F1> :call Win32Help('D:\Dropbox\Tools\AutoHotkey\AutoHotkeyJP.chm',expand('<cword>'))<CR>

"todo:AutoHotKey�X�N���v�g���J���Ă���Ƃ��ɂ́AF1�Ńw���v�����������B

" --- FileType:html

"Automatic Line Break Insertion
autocmd FileType html,php,xml,eruby set formatoptions+=tl

autocmd FileType html,php,xml,eruby source $VIMRUNTIME/plugin/xml.vim 
autocmd FileType html,php,xml,eruby set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead   *.htm,*.html,*.rhtml	source $VIMRUNTIME/after/ftplugin/html_snippets.vim
autocmd BufNewFile,BufRead   *.htm,*.html,*.rhtml,*.xml	source $VIMRUNTIME/plugin/CloseTag.vim
autocmd BufNewFile *.htm,*.html,*.rhtml	0r $VIM/templates/template.html
":echo char2nr("-")
" % = <% �` %>
autocmd BufNewFile,BufRead   *.rhtml let g:surround_32 = "<% \r %>"
" = = <%= �` %>
autocmd BufNewFile,BufRead   *.rhtml let g:surround_61 = "<%= \r %>"
" ! = <!-- �` -->
autocmd BufNewFile,BufRead   *.html let g:surround_33 = "<!-- \r -->"

" --- FileType:Ruby

autocmd FileType ruby set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2
"autocmd FileType ruby source $VIMRUNTIME/ftplugin/ruby.vim 
"autocmd FileType ruby source $VIMRUNTIME/plugin/refe.vim 
autocmd BufNewFile *.rb	0r $VIM/templates/template.rb
"
" f5�ŁAruby�t�@�C�������s�B"
autocmd FileType ruby nmap <F5> :make -c %<CR>

" HTML�w���v��\��
autocmd FileType ruby nmap <S-F1> :call Win32Help('D:\Dropbox\Tools\ruby\rubymanjp.chm',expand('<cword>'))<CR>
"nmap <S-F1> :call Win32Help(expand('<cword>'))<CR>

" --- html.vim

" �^�O���������ɂ���
let g:html_tag_case = 'lowercase'
" �^�O�̑啶�����������������o����
let g:html_tag_case_autodetect = 'yes'
" �c�[���o�[ �I��
let g:no_html_toolbar = 'no'
" �}�b�v��xhtml�p�ɂ���B(+�������ɂȂ�)
let g:do_xhtml_mappings = 'yes'
" ������map���㏑��
let g:no_html_map_override = 'yes'

" �f�t�H�̕����R�[�h ;ct�Ŏg�p
let g:html_default_charset = 'shift_jis' 

" �����̃e���v���[�g;html�Ŏg���ɂ�
let g:html_template = '~/Templates/template.html'
" ���@�\���ĂȂ��H�H�H
" Editor: %authorname% (%authoremail%) �݂����Ȋ����ŁB
let g:html_authorname  = '��Ђ̋{'
let g:html_authoremail = 'rohinomiya@gmail.com'


" --- neocomplcache - �e��⊮���s��

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Snippets
let g:neocomplcache_snippets_dir = '$VIM/snippets'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'autohotkey' : $VIM.'/dict/autohotkey.dic',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" --- rcodetools.vim

" <S-F9>�Ō��ݍs/�I���s��xmpfilter�����s
map <silent> <S-F9> !xmpfilter -a<cr>
nmap <silent> <S-F9> V<S-F9>
imap <silent> <S-F9> <ESC><S-F9>a

" <S-F90>�Ńo�b�t�@�S�̂�xmpfilter�����s 
nmap <silent> <S-F90> mzggVG!xmpfilter -a<cr>'z
imap <silent> <S-F90> <ESC><S-F90>

" <S-F91>�Ō��ݍs/�I���s�Ɂu# =>�v�}�[�N��ǉ�
vmap <silent> <S-F91> !xmpfilter -m<cr>
nmap <silent> <S-F91> V<S-F91>
imap <silent> <S-F91> <ESC><S-F91>a

" <S-F92>�Ō��ݍs/�I���s�́u# =>�v�}�[�N���폜
vmap <silent> <S-F92> ms:call RemoveRubyEval()<CR>
nmap <silent> <S-F92> V<S-F92>
imap <silent> <S-F92> <ESC><S-F92>a

function! RemoveRubyEval() range
  let begv = a:firstline
  let endv = a:lastline
  normal Hmt
  set lz
  execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
  normal 'tzt`s
  set nolz
  redraw
endfunction

" --- shartchar.vim
"inoremap <expr> _ smartchr#one_of(' <- ', '_')
"inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')

