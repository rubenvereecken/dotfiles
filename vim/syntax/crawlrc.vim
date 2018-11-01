" Vim syntax file
" Author: Ruben Vereecken

if exists("b:current_syntax")
  finish
endif

syntax case ignore

syn keyword crawlKeyword true false

syn match crawlComment  "^#.*$"
syn match crawlVimModeline "\v^\#[ !]?vim.*$"

syntax keyword crawlOption message_colour

syn match crawlOperator "\v\:\="
syn match crawlOperator "\v\+\="
syn match crawlOperator "\v\^\="

syn match crawlStatement "\v^[a-z]" transparent contains=crawlIdentifier,crawlVariable,crawlOperator,crawlRegex,crawlChannelAndRegex,crawlOption
syn match crawlIdentifier "[a-zA-Z]+" contained
syn match crawlColon "\v\:" transparent
syn region crawlChannelAndRegex start="+= " end="$" transparent contains=crawlChannel,crawlRegex
syn match crawlChannel "\v[a-z]+" nextgroup=crawlColon contained

syn include @luacode syntax/lua.vim
syn region crawlLua start="\v^\:" end="\v^$" keepend contains=@luacode

syn include @p6RegexBlock @p6Key syntax/perl6.vim
" syn region crawlRegex start="\v\+\= " end="\v.$" keepend
" syn region crawlRegex start="\v\+\= " end="\v.$" keepend contains=@p6RegexBlock

hi def link crawlComment Comment
hi def link crawlVimModeline Include

hi def link crawlKeyword Keyword
hi def link crawlOption Keyword
hi def link crawlOperator Operator
hi def link crawlRegex Error

hi def link crawlChannel Keyword
hi def link crawlIdentifier Error


let b:current_syntax = "crawlrc"
