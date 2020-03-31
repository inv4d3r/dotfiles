set history filename ~/.gdb_history
set history save on
set history size 1024
set history remove-duplicates 1024

set print pretty
set print symbol-filename on
set print array on
set print array-indexes on

skip -gfi /usr/include/c++/8/bits/*.h
