syntax case match

" Basic building blocks of a timesheet.txt file.
syntax match timesheetTZLine    /^\s*TZ\s\+.*/ contains=@timesheetTZCluster
syntax match timesheetDateLine  /^\s*[0-9]\{4}\(-[0-9]\{2}\)\{2}:/ contains=@timesheetDateCluster
syntax match timesheetEntryLine /^\s*\([0-9]\{4}\|[0-9]{6}\)[.^[:space:]]/ contains=@timesheetEntryCluster

" Timezone line.
syntax cluster timesheetTZCluster contains=timesheetTZKeyword,timesheetTimezone,timesheetComment
syntax keyword timesheetTZKeyword TZ contained nextgroup=timesheetTimezone skipwhite
syntax match   timesheetTimezone  /.\{-1,}/ contained
highlight link timesheetTZKeyword Statement
highlight link timesheetTimezone  Identifier

" Date line.
syntax cluster timesheetDateCluster contains=timesheetDate,timesheetComment
syntax match   timesheetDate /[0-9-]\+/ contained
highlight link timesheetDate Number

" Entry line.
syntax cluster timesheetEntryCluster contains=timesheetEntryTime,timesheetComment
syntax match   timesheetEntryTime /[0-9]\+/ contained nextgroup=timesheetEntryStop,timesheetEntryContinue,timesheetEntrySpec
syntax match   timesheetEntryStop     /\./ contained
syntax match   timesheetEntryContinue /\^/ contained
syntax match   timesheetEntrySpec     /\s\+.\+/ contained contains=timesheetEntryTag,timesheetEntryBillable,timesheetComment
syntax match   timesheetEntryTag      /\s\+#\S\+/ contained
syntax match   timesheetEntryBillable /\s\+!\?\$/ contained
highlight link timesheetEntryTime     Number
highlight link timesheetEntryStop     Operator
highlight link timesheetEntryContinue Operator
highlight link timesheetEntryTag      Identifier
highlight link timesheetEntryBillable Special

" Comments.
syntax match   timesheetComment /\v(^\s*#|\s+#($|\s+)).*$/
highlight link timesheetComment Comment
