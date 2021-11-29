# lilyvim
A vim plugin for live rendering LilyPond buffers into ~~the PDF reader of your
choice~~ the Zathura PDF reader.

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
- [X] Compile .ly files on write
- [X] Open the corresponding file in Zathura
- [X] Shuttle changes to Zathura (this is free with Zathura)
- [X] Don't open Zathura if the target file doesn't exist
- [X] Check that Zathura is available to use at startup
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
