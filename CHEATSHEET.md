Cheetsheet for VIM, TMUX and iTerm2
===

* [VIM](#vim)
  * [Tips](#tips)
* [TMUX](#tmux)
  * [Bindings](#bindings)
  * [Commands](#commands)
* [iTerm2](#iterm2)

### VIM
| command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `:noh`                 | Disable search highlight till next search                                       |
| `:%bd\e#`              | Close all buffers but current                                                   |
| `!python -m json.tool` | Pretty print JSON                                                               |
| `:ls`                  | List of open buffers (`a` == active, `h` == hidden)                             |
| `:buffers`             | List of open buffers (`a` == active, `h` == hidden)                             |
| `:buffer 1`            | Opens buffer 1, or any other number                                             |
| `q#`                   | Record macro at character # (Any input is accepted here, eg: `q1` records at 1) |
| `@#`                   | Replay recorded macro at character #                                            |

#### NERDTree
| command                | Description                                                                     |
|:-----------------------|:--------------------------------------------------------------------------------|
| `⇧+i`                  | In NerdTree show hidden files and directories                                   |

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
| command      | Description                           |
|:-------------|:--------------------------------------|
| `<prefix>-?` | Show bindings                         |
| `<prefix>-1` | Move to window 1, or any other number |
| `<prefix>-s` | Show active tmux sessions             |
| `<prefix>-c` | Create new window                     |
| `<prefix>-w` | List windows                          |

#### Commands
| command                                | Description                                                               |
|:---------------------------------------|:--------------------------------------------------------------------------|
| `:new-window -t session:1 -n "foobar"` | Create new tmux window in session "session" at index 1 with name "foobar" |
| `:send-keys -t session:1 ...`          | Send keys to tmux session "session" index 1                               |
| `:list-keys`                           | List all keybindins in all modes (copy-mode copy-mode-vi prefix root)     |


### iTerm2

| command  | Description                               |
|:---------|:------------------------------------------|
| `⌘+d`    | Vertical split                            |
| `⌘+⇧+d`  | Horizontal split                          |
| `⌘+⇧+i`  | Broadcast input to all splits in all tabs |
| `⌘+⌥⇧+i` | Broadcast input to current                |
| `⌘+1`    | Move to tab 1, or any other number        |
