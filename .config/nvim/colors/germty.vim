" Author James Ferrier
" Based on the darkblue theme. Looks best with monokai colors from cmder

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "germty"

hi Normal			ctermfg=gray ctermbg=black
hi ErrorMsg			ctermfg=white ctermbg=lightblue
hi Visual			ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS		ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo				ctermfg=red ctermbg=darkblue
hi Search			ctermfg=white ctermbg=darkblue cterm=underline term=underline
hi IncSearch		ctermfg=darkblue ctermbg=gray

hi SpecialKey		ctermfg=238 cterm=none
hi Directory		ctermfg=cyan
hi Title			ctermfg=magenta cterm=bold
hi WarningMsg		ctermfg=red
hi WildMenu			ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg			ctermfg=lightblue
hi MoreMsg			ctermfg=darkgreen ctermfg=darkgreen
hi Question			ctermfg=green cterm=none
hi NonText			ctermfg=239

hi StatusLine		ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC		ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit		ctermfg=black ctermbg=gray term=none cterm=none

hi Folded			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn		ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr			ctermfg=green cterm=none

hi DiffAdd			ctermbg=darkblue term=none cterm=none
hi DiffChange		ctermbg=magenta cterm=none
hi DiffDelete		ctermfg=blue ctermbg=cyan
hi DiffText			cterm=bold ctermbg=red

hi Cursor			ctermfg=black ctermbg=yellow
hi lCursor			ctermfg=black ctermbg=white
hi ColorColumn		ctermbg=236

hi Comment			ctermfg=59
hi Constant			ctermfg=magenta cterm=none
hi Special			ctermfg=brown cterm=none gui=none
hi Identifier		ctermfg=101 cterm=none
hi Conditional		ctermfg=204 cterm=none
hi Keyword			ctermfg=204 cterm=none
hi Statement		ctermfg=yellow cterm=none
hi PreProc			ctermfg=magenta cterm=none
hi type				ctermfg=green cterm=none
hi Underlined		cterm=underline term=underline
hi Ignore			ctermfg=bg

hi javascriptIdentifier ctermfg=cyan cterm=none

hi phpIdentifier ctermfg=cyan cterm=none
hi phpVarSelector ctermfg=red cterm=none
