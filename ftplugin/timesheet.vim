" Create a new timestamp entry at the end of the file.
function! s:NewTimesheetEntry()
	" Go to the end of the file, because that's the only place where
	" inserting a new timestamped item makes sense.
	normal G
	" Look backwards for a date.
	let l:dateline = search('\v^\d{4}-\d{2}-\d{2}:$', 'bcnw')
	" If there's none or it's not the current day, create one.
	if !l:dateline || getline(l:dateline) != strftime("%Y-%m-%d:")
		execute "normal o\n" . strftime("%Y-%m-%d:")
	endif
	" Insert the timestamp and start insert mode.
	execute "normal o" . strftime("%H%M")
endfunction

nnoremap <Plug>(Timesheet) :call <SID>NewTimesheetEntry()<CR>

" Some mappings to insert a timestamped new line.
if !hasmapto('<Plug>(Timesheet)')
	nmap <buffer> <LocalLeader>n <Plug>(Timesheet)GA<Space><Space>
	nmap <buffer> <LocalLeader>s <Plug>(Timesheet)GA.<Esc>
	nmap <buffer> <LocalLeader>c <Plug>(Timesheet)GA^<Esc>
endif
