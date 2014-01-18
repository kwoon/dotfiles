" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by the syntax files for sass and css. Thanks to the authors of
" those files!

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'scss'
endif

runtime! syntax/css.vim
runtime! syntax/css/*.vim

syn case ignore

" XXX fix for #20, can be removed once the patch is in vim's css.vim
syn match cssSpecialCharQQ +\\\\\|\\"+ contained
syn match cssSpecialCharQ +\\\\\|\\'+ contained

" XXX redefining font keyword to avoid it being displayed as deprecated
syn keyword cssFontProp font

syn region scssDefinition matchgroup=cssBraces start='{' end='}' contains=TOP containedin=cssMediaBlock

syn match scssProperty "\%([[:alnum:]-]\)\+\s*:" contains=css.*Prop,cssVendor containedin=cssMediaBlock,scssDefinition nextgroup=scssAttribute,scssAttributeWithNestedDefinition
syn match scssAttribute ":[^;]*;" contains=css.*Attr,cssValue.*,cssColor,cssFunction,cssString.*,cssUrl,scssDefault,scssFunction,scssInterpolation,scssNull,scssVariable containedin=scssProperty

syn match scssAttributeWithNestedDefinition ": [^#]*{\@=" nextgroup=scssNestedDefinition contains=cssValue.*,scssVariable
syn region scssNestedDefinition matchgroup=cssBraces start="{" end="}" contained contains=cssComment,scssComment,scssProperty,scssNestedProperty

" CSS properties from https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
" align
syn keyword scssNestedProperty contained content items self nextgroup=scssAttribute
" animation
syn keyword scssNestedProperty contained delay direction duration fill-mode iteration-count name play-state timing-function nextgroup=scssAttribute
" background
syn keyword scssNestedProperty contained attachment clip color image origin position repeat size nextgroup=scssAttribute
" border
syn keyword scssNestedProperty contained bottom bottom-color bottom-left-radius bottom-right-radius bottom-style bottom-width nextgroup=scssAttribute
syn keyword scssNestedProperty contained collapse color nextgroup=scssAttribute
syn keyword scssNestedProperty contained image image-outset image-repeat image-slice image-source image-width nextgroup=scssAttribute
syn keyword scssNestedProperty contained left left-color left-style left-width nextgroup=scssAttribute
syn keyword scssNestedProperty contained radius nextgroup=scssAttribute
syn keyword scssNestedProperty contained right right-color right-style right-width nextgroup=scssAttribute
syn keyword scssNestedProperty contained spacing style nextgroup=scssAttribute
syn keyword scssNestedProperty contained top top-color top-left-radius top-right-radius top-style top-width nextgroup=scssAttribute
syn keyword scssNestedProperty contained width nextgroup=scssAttribute
" box
syn keyword scssNestedProperty contained decoration-break shadow sizing nextgroup=scssAttribute
" break
syn keyword scssNestedProperty contained after before inside nextgroup=scssAttribute
" column
syn keyword scssNestedProperty contained count fill gap rule rule-color rule-style rule-width span width nextgroup=scssAttribute
" counter
syn keyword scssNestedProperty contained increment reset nextgroup=scssAttribute
" flex
syn keyword scssNestedProperty contained basis direction flow grow shrink wrap nextgroup=scssAttribute
" font
syn keyword scssNestedProperty contained family feature-settings kerning language-override size size-adjust stretch style synthesis nextgroup=scssAttribute
syn keyword scssNestedProperty contained variant variant-alternates variant-caps variant-east-asian variant-ligatures variant-numeric variant-position nextgroup=scssAttribute
syn keyword scssNestedProperty contained weight nextgroup=scssAttribute
" image
syn keyword scssNestedProperty contained rendering resolution orientation nextgroup=scssAttribute
" list
syn keyword scssNestedProperty contained style style-image style-position style-type nextgroup=scssAttribute
" margin/padding
syn keyword scssNestedProperty contained bottom left right top nextgroup=scssAttribute
" max/min
syn keyword scssNestedProperty contained height width nextgroup=scssAttribute
" nav
syn keyword scssNestedProperty contained down index left right up nextgroup=scssAttribute
" object
syn keyword scssNestedProperty contained fit position nextgroup=scssAttribute
" outline
syn keyword scssNestedProperty contained color offset style width nextgroup=scssAttribute
" overflow
syn keyword scssNestedProperty contained wrap x y nextgroup=scssAttribute
" page
syn keyword scssNestedProperty contained break-after break-before break-inside nextgroup=scssAttribute
" text
syn keyword scssNestedProperty contained align align-last combine-horizontal nextgroup=scssAttribute
syn keyword scssNestedProperty contained decoration decoration-color decoration-line decoration-style nextgroup=scssAttribute
syn keyword scssNestedProperty contained indent orientation overflow rendering shadow transform underline-position nextgroup=scssAttribute
" transform
syn keyword scssNestedProperty contained origin style nextgroup=scssAttribute
" transition
syn keyword scssNestedProperty contained delay duration property timing-function nextgroup=scssAttribute
" unicode
syn keyword scssNestedProperty contained bidi range nextgroup=scssAttribute
" word
syn keyword scssNestedProperty contained break spacing wrap nextgroup=scssAttribute

syn region scssInterpolation matchgroup=scssInterpolationDelimiter start="#{" end="}" contains=cssValue.*,cssColor,cssString.*,scssFunction,scssVariable containedin=cssString.*,cssUrl,scssFunction

" functions from http://sass-lang.com/documentation/Sass/Script/Functions.html
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(rgb\|rgba\|red\|green\|blue\|mix\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(hsl\|hsla\|hue\|saturation\|lightness\|adjust-hue\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(lighten\|darken\|saturate\|desaturate\|grayscale\|complement\|invert\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(alpha\|opacity\|opacify\|fade-in\|transparentize\|fade-out\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(adjust-color\|scale-color\|change-color\|ie-hex-str\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(unquote\|quote\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(percentage\|round\|ceil\|floor\|abs\|min\|max\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(length\|nth\|join\|append\|zip\|index\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(type-of\|unit\|unitless\|comparable\)\s*(" end=")" oneline keepend
syn region scssFunction contained matchgroup=scssFunctionName start="\<\(if\)\s*(" end=")" oneline keepend
" custom functions
syn region scssFunction contained matchgroup=scssFunctionName start="\<\([[:alnum:]-]\)\+\s*(" end=")" oneline keepend
syn match scssParameterList ".*" contained containedin=cssFunction,scssFunction contains=cssString.*,cssValue.*,scssVariable

syn match scssVariable "$[[:alnum:]_-]\+" containedin=cssFunction,scssFunction,cssMediaType
syn match scssVariableAssignment "($[[:alnum:]_-]\+\s*)\@<=:" nextgroup=scssAttribute
syn keyword scssNull null contained;

syn match scssMixin "^@mixin" nextgroup=scssMixinName skipwhite
syn match scssMixinName "[[:alnum:]_-]\+" contained nextgroup=scssDefinition,scssMixinParams
syn region scssMixinParams contained contains=cssColor,cssValue.*,cssString.*,scssVariable,scssFunction start="(" end=")" oneline extend
syn match scssInclude "@include" nextgroup=scssMixinName skipwhite
syn match scssContent "@content" contained containedin=scssDefinition

syn match scssFunctionDefinition "^@function" nextgroup=scssFunctionName skipwhite
syn match scssFunctionName "[[:alnum:]_-]\+" contained nextgroup=scssDefinition
syn match scssReturn "@return" containedin=scssFunction
syn match scssExtend "@extend" nextgroup=scssExtendedSelector skipwhite
syn match scssExtendedSelector "[^ ;]\+" contained contains=cssTagName,cssPseudoClass,scssIdChar,scssClassChar,scssPlaceholderChar nextgroup=scssOptional skipwhite
syn match scssOptional "!optional" contained
syn match scssImport "@import" nextgroup=scssImportList
syn match scssImportList "[^;]\+" contained contains=cssString.*,cssMediaType,cssUrl

syn match scssIdChar "#[[:alnum:]_-]\@=" nextgroup=scssSelectorName containedin=cssMediaBlock
syn match scssClassChar "\.[[:alnum:]_-]\@=" nextgroup=scssSelectorName containedin=cssMediaBlock
syn match scssPlaceholderChar "%[[:alnum:]_-]\@=" nextgroup=scssSelectorName containedin=cssMediaBlock
syn match scssSelectorName "[[:alnum:]_-]\+" contained

syn match scssAmpersand "&" nextgroup=cssPseudoClass

syn match scssDebug "@debug" nextgroup=scssOutput
syn match scssWarn "@warn" nextgroup=scssOutput
syn match scssOutput "[^;]\+" contained contains=cssValue.*,cssString.*,scssFunction,scssVariable
syn match scssDefault "!default" contained

syn match scssIf "@\(else \)\=if" nextgroup=scssCondition
syn match scssCondition "[^{]\+" contained contains=cssValue.*,cssString.*,scssFunction,scssNull,scssVariable
syn match scssElse "@else\(\s*\({\|$\)\)\@="
syn match scssWhile "@while" nextgroup=scssCondition
syn match scssFor "@for\s\+.*from\s\+.*\(to\|through\)\s\+[^{ ]\+" contains=cssValueNumber,scssFunction,scssVariable
syn match scssEach "@each\s\+\$[[:alnum:]_-]\+\s\+in" contains=scssVariable nextgroup=scssList
syn match scssList "[^{]\+" contained contains=scssFunction,scssVariable
syn cluster scssControl contains=scssIf,scssElse,scssWhile,scssFor,scssEach

syn match scssComment "//.*$" contains=@Spell
syn keyword scssTodo TODO FIXME NOTE OPTIMIZE XXX contained containedin=cssComment,scssComment

hi def link scssNestedProperty cssProp
hi def link scssVariable  Identifier
hi def link scssNull      Constant
hi def link scssMixin     PreProc
hi def link scssMixinName Function
hi def link scssContent   PreProc
hi def link scssFunctionDefinition  PreProc
hi def link scssFunctionName Function
hi def link scssFunction  Constant
hi def link scssReturn    Statement
hi def link scssInclude   PreProc
hi def link scssExtend    PreProc
hi def link scssOptional  Special
hi def link scssComment   Comment
hi def link scssIdChar    Special
hi def link scssClassChar Special
hi def link scssPlaceholderChar Special
hi def link scssSelectorName Identifier
hi def link scssAmpersand Character
hi def link scssDebug     Debug
hi def link scssWarn      Debug
hi def link scssDefault   Special
hi def link scssIf        Conditional
hi def link scssElse      Conditional
hi def link scssWhile     Repeat
hi def link scssFor       Repeat
hi def link scssEach      Repeat
hi def link scssInterpolationDelimiter Delimiter
hi def link scssImport    Include
hi def link scssTodo      Todo

let b:current_syntax = "scss"
if main_syntax == 'scss'
  unlet main_syntax
endif
