# lilyvim
A vim plugin for live rendering Lilypond buffers into ~~the PDF reader of your
choice~~ the Zathura PDF reader.

## Use
#### Commands
- `:LilyVimCompile`: Compile the current Lilypond buffer.
- `:LilyVimStartPreview`: Open a Zathura instance for the PDF file
  corresponding to your current Lilypond buffer.
- `:LilyVimToggleCompilation`: Enable and disable compiling the open Lilypond
  buffer on write.

#### Settings
Set the following variables in your `.vimrc` to automatically enable `lilyvim`'s
features when you open a lilypond buffer.
```
let g:lilyvim_autocompile = 1
let g:lilyvim_autopreview = 1
```

## TODO
- [X] Compile .ly files on write
- [X] Open the corresponding file in Zathura
- [X] Shuttle changes to Zathura (this is free with Zathura)
- [ ] Don't open Zathura if the target file doesn't exist
- [ ] Open Zathura when the target file exists, if it did not exist before
- [ ] Update preview when switching buffers
- [ ] Check that Zathura is available to use at startup
- [ ] Allow reader backends besides Zathura

## CONTRIBUTING
Pull requests welcome!
