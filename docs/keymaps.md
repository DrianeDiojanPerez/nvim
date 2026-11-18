# Keymaps

Leader is space. Mode is `n` for normal, `v` for visual, `x` for visual without select mode, and `i` for insert.

## Editing

| Key | Mode | What it does |
|---|---|---|
| `J` / `K` | v | Move the selected lines down or up |
| `J` | n | Join lines and keep the cursor where it was |
| `<C-d>` / `<C-u>` | n | Half page down or up, cursor centered |
| `n` / `N` | n | Next or previous search match, centered |
| `<leader>p` | x | Paste over the selection without losing what you copied |
| `<leader>y` | n, v | Copy to the system clipboard |
| `<leader>Y` | n | Copy the line to the system clipboard |
| `<leader>d` | n, v | Delete without copying |
| `<C-a>` | n | Select the whole file |
| `<C-c>` | i | Same as Esc |
| `Q` | n | Does nothing |
| `<leader>wr` | n | Replace the word under the cursor in the whole file |
| `<leader>x` | n | Make the current file executable |
| `<leader>e` | n | Open the file explorer |

## Quickfix and location list

| Key | What it does |
|---|---|
| `<C-k>` / `<C-j>` | Next or previous quickfix item |
| `<leader>k` / `<leader>j` | Next or previous location list item |

## Telescope

| Key | What it does |
|---|---|
| `<leader>f` | Find files, hidden files too |
| `<leader>s` | Search text in all files |
| `<leader>ws` | Search for the word under the cursor |
| `<leader>wf` | Find files named like the word under the cursor |
| `<leader>vh` | Search the help |

## LSP

These work in files where a language server is running.

| Key | Mode | What it does |
|---|---|---|
| `gd` | n | Go to definition |
| `K` | n | Show docs for the word under the cursor |
| `<leader>vd` | n | Show the error on this line |
| `[d` / `]d` | n | Next or previous error |
| `<leader>vca` | n | Code actions |
| `<leader>vrr` | n | Find references |
| `<leader>vrn` | n | Rename |
| `<leader>vws` | n | Search symbols in the project |
| `<C-h>` | i | Show function signature |

## Completion

| Key | What it does |
|---|---|
| `<C-space>` | Open the menu |
| `<C-n>` / `<C-p>` | Next or previous item |
| `<C-y>` | Accept |
| `<C-e>` | Close the menu |

## Git and undo

| Key | What it does |
|---|---|
| `<leader>gs` | Open fugitive's git status |
| `gu` / `gh` | In a merge conflict, take the left or right side |
| `<leader>u` | Toggle undotree |
