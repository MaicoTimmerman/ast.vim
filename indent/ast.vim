" Language:        AST
" Author:          MAico Timmerman
" Version:         1.0
" URL:             https://github.com/MaicoTimmerman/ast.vim

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetAnsibleIndent(v:lnum)
setlocal indentkeys=!^Fo,O,0#,<:>,-
setlocal cinkeys-=,
setlocal nosmartindent

" Only define the function once.
if exists('*GetAnsibleIndent')
  finish
endif

function GetAnsibleIndent(lnum)
  " Check whether the user has set g:ansible_options["ignore_blank_lines"].

  let prevlnum =  prevnonblank(a:lnum - 1)
  if prevlnum == 0
    return 0
  endif
  let prevline = getline(prevlnum)

  let indent = indent(prevlnum)
  let increase = indent + &sw
  let decreate = indent - &sw

  " previous line ends with {: ++
  if prevline =~ '.*{$'
    return increase

  " current line ends with }: --
  elseif getline(lnum) =~ '.*}$'
    return decrease
  else
    return indent
  endif
endfunction

