Cheetsheet for VIM, TMUX and iTerm2
===

* [VIM](#vim)
  * [Tips](#tips)
* [TMUX](#tmux)
  * [Bindings](#bindings)
  * [Commands](#commands)
* [iTerm2](#iterm2)

### VIM
[Essentials Cheetsheet](https://vimsheet.com)

Generic naviation keys
#### Modes
| Command             | Description                                       |
|:--------------------|:--------------------------------------------------|
| `<ESC>`             | Normal mode                                       |
| `i`                 | Insert mode                                       |
| `I`                 | Insert mode beginning of line                     |
| `a`                 | Insert mode 1 column after the cursor             |
| `A`                 | Insert mode end of line                           |
| `o`                 | Insert mode with new line below                   |
| `O`                 | Insert mode with new line above                   |
| `v`                 | Visual mode                                       |
| `V`                 | Visual mode line                                  |
| `<CTRL>V`           | Visual mode BLOCK                                 |
| `<LEADER>p`         | Paste mode                                        |

#### In file navigation
| Command         | Description                                           |
|:----------------|:------------------------------------------------------|
| `h`             | Move cursor left                                      |
| `j`             | Move cursor up                                        |
| `k`             | Move cursor down                                      |
| `l`             | Move cursor right                                     |
| `w`             | Jump word forward                                     |
| `b`             | Jump word backwards                                   |
| `gg`            | Jump to top of document                               |
| `G`             | Jump to bottom of document                            |
| `<SHIFT>[`      | Jump to next new line                                 |
| `<SHIFT>]`      | Jump to previous new line                             |

#### Generic
| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `:noh`                 | Disable search highlight till next search                                       |
| `:%bd\e#`              | Close all buffers but current                                                   |
| `!python -m json.tool` | Pretty print JSON                                                               |
| `:ls`                  | List of open buffers (`a` == active, `h` == hidden)                             |
| `:buffers`             | List of open buffers (`a` == active, `h` == hidden)                             |
| `:buffer 1`            | Opens buffer 1, or any other number                                             |
| `q#`                   | Record macro at character # (Any input is accepted here, eg: `q1` records at 1) |
| `@#`                   | Replay recorded macro at character #                                            |
| `lopen`                | Open the linting error menu                                                     |
| `<LEADER>c`            | Copy selected lines with pbcopy                                                 |

#### Spell Check

| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `,ss`                  | Enalbe spell check                                                              |
| `,s?`                  | Give suggestion of work correction                                              |
| `[s`                   | Go to next wrong spelled word                                                   |
| `]s`                   | Go to previous wrong spelled word                                               |
| `zg`                   | Mark the word as a good word                                                    |
| `zw`                   | Mark the word as a bad word                                                     |
| `zug`                  | Undo the Mark word as a good word                                               |
| `zuw`                  | Undo the Mark word as a bad word                                                |

#### Folds Check

| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `zf`                   | Create fold from selection VISUAL MODE ONLY                                     |
| `zr`                   | Unfold all folds                                                                |

#### Pane/Split navigation
| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `<CTRL>h`              | Move to pane left from cursor                                                   |
| `<CTRL>j`              | Move to pane below from cursor                                                  |
| `<CTRL>k`              | Move to pane above from cursor                                                  |
| `<CTRL>l`              | Move to pane right from cursor                                                  |

#### File navigation
##### Nerd Tree
| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `<leader>nf`           | Open NERDTree                                                                   |
| `<RETURN>`             | Open selected file                                                              |
| `s`                    | Open selected file in vertical split                                            |
| `i`                    | Open selected file in horizontal split                                          |

##### CTRLP
| Command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `<CTRL>f`              | Open CTRLP                                                                      |
| `<RETURn>`             | Open selected file                                                              |
| `<CTRL>x`              | Open selected file in horizontal split                                          |

#### Markdown

| Command        | Description               |
|:---------------|:--------------------------|
| `:TableFormat` | Format the markdown table

#### NERDTree

| Command | Description                                   |
|:--------|:----------------------------------------------|
| `shift+i`   | In NerdTree show hidden files and directories |
| `shift+r`   | In NerdTree refresh files and directories     |

#### Tips

* A number eg: `10` and then a vim command (not limited to movemets) will repeat that command X times.
    ```
    10@#
    ```
    will for example repeat recorded macro at position `#` 10 times

    ```
    100.
    ```
    will repeat the last command 100 times

    ```
    100j
    ```
    will move the cursor 100 lines down


### TMUX
#### Bindings

| Command      | Description                           |
|:-------------|:--------------------------------------|
| `<prefix>-?` | Show bindings                         |
| `<prefix>-1` | Move to window 1, or any other number |
| `<prefix>-s` | Show active tmux sessions             |
| `<prefix>-c` | Create new window                     |
| `<prefix>-w` | List windows                          |

#### Commands

| Command                                | Description                                                               |
|:---------------------------------------|:--------------------------------------------------------------------------|
| `:new-window -t session:1 -n "foobar"` | Create new tmux window in session "session" at index 1 with name "foobar" |
| `:send-keys -t session:1 ...`          | Send keys to tmux session "session" index 1                               |
| `:list-keys`                           | List all keybindins in all modes (copy-mode copy-mode-vi prefix root)     |
| `:select-pane -e`                      | Enables input on the selected pane                                        |
| `:select-pane -d`                      | Disable input on the selected pane                                        |

### iTerm2

| Command  | Description                               |
|:---------|:------------------------------------------|
| `⌘+d`    | Vertical split                            |
| `⌘+⇧+d`  | Horizontal split                          |
| `⌘+⇧+i`  | Broadcast input to all splits in all tabs |
| `⌘+⌥⇧+i` | Broadcast input to current                |
| `⌘+1`    | Move to tab 1, or any other number        |
