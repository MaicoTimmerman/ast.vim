"Vim syntax file
" Language:     ASTlang

" Quit when a (custom) syntax file was already loade
if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:ft = matchstr(&ft, '^\([^.]\)\+')

syn keyword astType     int int8 int16 int32 int64
syn keyword astType     uint uint8 uint16 uint32 uint64
syn keyword astType     string bool double float

syn keyword astStruct   attributes children child cycle pass passes subphases
syn keyword astStruct   enum node nodeset nodes phase traversal values

syn keyword astModifier prefix to construct mandatory info func root

syn keyword astConst    false true NULL

syn region	astString		    start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+
syn region	astCommentSingle	start="//" skip="\\$" end="$" keepend
syn region	astCommentMulti	    matchgroup=astCommentStart start="/\*" end="\*/"

hi def link astType             Type
hi def link astStruct           Repeat
hi def link astModifier         StorageClass
hi def link astConst            Constant
hi def link astCommentSingle    Comment
hi def link astCommentMulti     Comment
hi def link astCommentStart     Comment
hi def link astString           String

let b:current_syntax = "ast"

unlet s:ft

let &cpo = s:cpo_save
unlet s:cpo_save
