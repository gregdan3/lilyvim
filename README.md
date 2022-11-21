# lilyvim

A vim plugin for live rendering LilyPond buffers into ~~the PDF reader of your
choice~~ the Zathura PDF reader.

I switched from using Vim to Neovim shortly after writing this project, so I haven't made any updates to it since. As far as I'm aware, it's the only Lilypond previewer that exists; That said, check out [vim-lilypond-suite](https://github.com/martineausimon/vim-lilypond-suite) and [nvim-lilypond-suite](https://github.com/martineausimon/nvim-lilypond-suite).

## Installation

Get [junegunn's vim-plug](https://github.com/junegunn/vim-plug), then add the following line to your `.vimrc`:

```vim
   Plug 'gregdan3/lilyvim'
```

Full setup:

```vim
call plug#begin()
    Plug 'gregdan3/lilyvim'
call plug#end()
```

## Use

#### Commands

- `:LilyVimCompile`: Compile the current LilyPond buffer.
- `:LilyVimStartPreview`: Open a Zathura instance for the PDF file
  corresponding to your current LilyPond buffer.
- `:LilyVimToggleCompilation`: Enable and disable compiling the open LilyPond
  buffer on write.

#### Settings

Set the following variables in your `.vimrc` to automatically enable `lilyvim`'s
features when you open a LilyPond buffer.

```
let g:lilyvim_autocompile = 1
let g:lilyvim_autopreview = 1
```

## TODO

- [x] Compile .ly files on write
- [x] Open the corresponding file in Zathura
- [x] Shuttle changes to Zathura (this is free with Zathura)
- [x] Don't open Zathura if the target file doesn't exist
- [x] Check that Zathura is available to use at startup
- [ ] Make Preview job singleton
  - [ ] Per buffer
  - [ ] Open Zathura when autoload set + compile succeeds + preview isn't
        started yet
  - [ ] Add `:LilyvimTogglePreview` in place of/in addition to
        `:LilyVimStartPreview`
- [ ] Update preview when switching buffers
- [ ] Allow reader backends besides Zathura

## CONTRIBUTING

Pull requests welcome!
