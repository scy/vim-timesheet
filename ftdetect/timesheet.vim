" We can't use :setfiletype here, since Vim already set filetype to text on
" files matching *.txt.
au BufRead,BufNewFile timesheet.txt set filetype=timesheet
