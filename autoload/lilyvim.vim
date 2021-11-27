" lilyvim - render LilyPond as you write
" Maintainer:   Gregory Danielson III <https://gregdan3.github.io/>
" Version:      0.1.0
" Repository:   https://github.com/gregdan3/lilyvim
" License:      GPL

if exists('g:LilyVimLoaded') || &compatible
  finish
end
let g:LilyVimLoaded = 1

function! lilyvim#LilyVimInit()
  if !exists('b:lilyvim_enabled')
    let b:lilyvim_enabled = 1
  end
endfunction

function! LilyVimCompileErrorCB(self, data) abort
  echom a:data
endfunction

function! GetCurBufName()
  " wrapper since this behavior is needed in 2 places
  let bufname = expand('%:p')
  return bufname
endfunction

function! s:GetPDFName(fname)
  " return pdf name based on filename. TODO: gross
  return join(split(a:fname, '\.')[0:-2] + ['pdf'], '.')
endfunction

function! s:CompilePDF(fname)
  " compile LilyPond file as pdf
  if !filereadable(a:fname)
    echoerr 'LilyPond file ' . a:fname . ' is not readable. Compile failed.'
    return
  endif
  let j = job_start('lilypond --pdf ' . a:fname, {'err_cb': 'LilyVimCompileErrorCB'})
  " TODO: check success?
  return j
endfunction

function! s:Compile()
  " compile current LilyPond buffer
  " TODO: settings? other output formats?
  let bufname = GetCurBufName()
  let j = s:CompilePDF(bufname)
  return j  " TODO
endfunction

function! s:ToggleCompilation()
  " set up autocmd for compile on write
  if !exists('#LilyVimCompileOnWrite#BufWritePost')
    augroup LilyVimCompileOnWrite
      autocmd!
      autocmd BufWritePost *.ly call <SID>Compile()
    augroup end
  else
    augroup LilyVimCompileOnWrite
      autocmd!
    augroup end
  endif
endfunction

function! s:StartPreview()
  let pdfname = s:GetPDFName(GetCurBufName())
  if !filereadable(pdfname)
    echomsg 'PDF ' . pdfname . ' is not readable. Preview failed.'
    return
  endif
  let j = job_start('zathura ' . pdfname, {'err_cb': 'LilyVimCompileErrorCB'})
  " TODO: check success?
  return j  " TODO
endfunction

" expose to user
command! LilyVimCompile call <SID>Compile()
command! LilyVimToggleCompilation call <SID>ToggleCompilation()
command! LilyVimStartPreview call <SID>StartPreview()

" catch user's settings
if exists('g:lilyvim_autocompile')
  call s:ToggleCompilation()
endif
if exists('g:lilyvim_autopreview')
  call s:StartPreview()
endif
