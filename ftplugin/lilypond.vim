if !get(g:, 'lilyvim_enabled', 1) | finish | endif
if exists('b:did_ftplugin') | finish | endif
let b:did_ftplugin = 1

if !(has('channel'))
  echoerr 'Error: lilyvim does not support your version of Vim'
  echom 'Please update to a version of Vim with channel support.'
  finish
endif

if !executable('zathura')
  echoerr 'Error: zathura is not available on your $PATH.'
  echom 'Please install the zathura pdf reader to use lilyvim.'
  finish  " TODO: later lilyvim will do more than just preview
endif

call lilyvim#LilyVimInit()
