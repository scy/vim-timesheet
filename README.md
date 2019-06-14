# vim-timesheet

This is a Vim package to edit [timesheet.txt](https://github.com/scy/timesheet.txt) files.
It's still kind of basic.

## Features

* detects files called `timesheet.txt` as `filetype=timesheet`
* syntax highlighting
* normal mode bindings:
  * `<LocalLeader>n`: create a new entry
  * `<LocalLeader>s`: stop the last entry
  * `<LocalLeader>c`: continue the last entry

The bindings are rather stupid:
For example, you'll be able to stop the entry even if none is running.
In other words, this plugin helps you _edit_ the files, it's not a time tracking UI.

## Status

It works.
There are some things missing (issue ID highlighting, error highlighting), but it's alright for the moment.

## Installation

It's compatible to the usual Vim package managers, if you're using one of these.

You can also use Vim 8's included package management by cloning this repository to `~/.vim/pack/vim-timesheet/start/vim-timesheet`.
