" Language: Undoc
" LICENSE: The Happy License

if exists("b:current_syntax")
	finish
endif

if !exists("main_syntax")
	let main_syntax = "undoc"
endif

syn sync minlines=10
syn case ignore

syn match undocBack "<"
syn region undocVariable start="^" end="$" contains=undocBack,undocType,undocDefault,undocDescription
syn match undocInclude "^\s*!.*$"
syn match undocComment "^\s*//.*$"
syn region undocReturn start="->" end="$"
syn match undocPackage "^\s*\[.*\]"
syn match undocClass "^\s*.*:$" contains=undocBack,undocDescription
syn match undocClass "^\s*.*:\s*=.*" contains=undocBack,undocDescription
syn match undocFunction contains=undocBack,undocArgument,undocReturn,undocDescription nextgroup=undocArgument,undocDescription "^\s*.*(.*).*$"
syn region undocArgument start=/(/ms=e+1 end=/)/me=s-1 contained
syn region undocDescription start="=" end="$"
syn match undocType contained contains=undocDefault,undocDescription ":.*$"
syn match undocDefault contained contains=undocDescription "@.*$"
syn region undocCode start=">>" end=">>.*$"

hi def link undocVariable Constant
hi def link undocInclude Identifier
hi def link undocType Type
hi def link undocDefault Identifier
hi def link undocComment Comment
hi def link undocDescription Structure
hi def link undocReturn Constant
hi def link undocPackage Identifier
hi def link undocClass Type
hi def link undocFunction Function
hi def link undocArgument Constant
hi def link undocBack Operator
hi def link undocCode String

let b:current_syntax = "undoc"
