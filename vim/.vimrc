""""""""""""""""""""""""""""""""""""
" Features
""""""""""""""""""""""""""""""""""""
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

""""""""""""""""""""""""""""""""""""
"Line
""""""""""""""""""""""""""""""""""""
" show line numbers
set number
set relativenumber
"
 """""""""""""""""""""""""""""""""""""
 " Indents
 """""""""""""""""""""""""""""""""""""
 " replace tabs with spaces
 set expandtab
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
 set softtabstop=4
 set shiftwidth=4

 " when deleting whitespace at the beginning of a line, delete
 " 1 tab worth of spaces (for us this is 2 spaces)
 set smarttab

 " when creating a new line, copy the indentation from the line above
 set autoindent

 """""""""""""""""""""""""""""""""""""
 " Search
 """""""""""""""""""""""""""""""""""""
 " Ignore case when searching
 set ignorecase
 set smartcase

 " highlight search results (after pressing Enter)
 set hlsearch

 " highlight all pattern matches WHILE typing the pattern
 set incsearch
 set smartcase

 """""""""""""""""""""""""""""""""""""
 " Mix
 """""""""""""""""""""""""""""""""""""
 " show the mathing brackets
set showmatch

""""""""""""""""""""""""""""""""""""
" Status
""""""""""""""""""""""""""""""""""""
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2
