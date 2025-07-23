" Enhanced .ipynb file detection and handling
au BufRead,BufNewFile *.ipynb set filetype=python
au BufRead,BufNewFile *.ipynb setlocal commentstring=#\ %s
au BufRead,BufNewFile *.ipynb setlocal foldmethod=expr
au BufRead,BufNewFile *.ipynb setlocal foldexpr=getline(v:lnum)=~'^#\\s%%'?'>1':'='
