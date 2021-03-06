My environment
==============

## Dependencies

 - [Git](https://git-scm.com/)
 - [tmux](https://github.com/tmux/tmux/wiki)
   ```bash
    $ brew install tmux
   ```
 - [GNU Stow](https://www.gnu.org/software/stow/)
   ```bash
    $ brew install stow
   ```
 - [Zplug](https://github.com/zplug/zplug)
   ```bash
   $ brew install zplug
   ```
 - [Ag](https://github.com/ggreer/the_silver_searcher)
   ```bash
   $ brew install the_silver_searcher
   ```

 - [Nerd Fonts](https://www.nerdfonts.com/)
   ```bash
   $ brew tap caskroom/fonts
   $ brew cask install font-hack-nerd-font
   ```

Install
-------

```bash
$ git clone git@github.com:katyanna/dotfiles.git
$ cd dotfiles/
$ ./install.sh
```

Terminal bindings
=================

* `Ctrl-a` - Move to the start of the line.
* `Ctrl-e` - Move to the end of the line.
* `Ctrl-b` - Move back one character.
* `Alt-b` - Move back one word.
* `Ctrl-f` - Move forward one character.
* `Alt-f` - Move forward one word.
* `Ctrl-u` - Delete from the cursor to the beginning of the line.
* `Ctrl-k` - Delete from the cursor to the end of the line.
* `Ctrl-w` - Delete from the cursor to the start of the word.
* `Esc-Del` - Delete previous word (may not work, instead try Esc
  followed by Backspace)
* `Ctrl-y` - Pastes text from the clipboard.
* `Ctrl-l` - Clear the screen leaving the current line at the top of the
  screen.
* `Ctrl-x` - Ctrl-u  Undo the last changes.'Ctrl-_ does the same
* `Alt-r` - Undo all changes to the line.
* `Alt-Ctrl-e` - Expand command line.
* `Ctrl-r` - Incremental reverse search of history.
* `Alt-p` - Non-incremental reverse search of history.
* `!!` - Execute last command in history
* `!abc` - Execute last command in history beginning with abc
* `!abc:p` - Print last command in history beginning with abc
* `!n` - Execute nth command in history
* `!$` - Last argument of last command
* `!^` - First argument of last command
* `!*` - All arguments of last command
* `!:[number]` - The [number] argument of last command
* `^abc^xyz` - Replace first occurance of abc with xyz in last command
  and execute it
* `cd -` - Go to previous directory
