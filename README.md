# Dotfiles

These are my dotfiles I've collected and improved since 2014 which includes
install scripts for my OSX, config for IRC chats, vim fonts, custom scripts I
made and many other things.

# Getting started

```
$ git clone --recursive https://github.com/kkoomen/dotfiles-osx dotfiles
$ cd dotfiles
```

### First-time install

After pulling the repository, run the following scripts:

```
$ bash scripts/install_1.sh
-- reboot
$ bash scripts/install_2.sh
```

### Update dotfiles

Simply run the `update.sh` in the root of the repository to recreate the
symlinks from the repository.


# Vim bundles

- `YouCompleteMe`<br />
Wicked fast autocompletion engine.

- `ale`<br />
A modern async linting engine with great configuration possibilities.

- `auto-pairs`<br />
Insert or delete brackets, parenthesis and quotes in pairs.

- `editorconfig-vim`<br />
Vim will adjust itself based on `.editorconfig` files.<br/>
When opening a new buffer it will look in parent directories for a
`.editorconfig` file and apply them to the local buffer as settings.

- `emmet-vim`<br />
Use CSS selectors in HTML to easily create divs or quickly wrap selected text in
tags.

- `indentLine`<br />
Adds an indicator to display the indention levels.

- `mru`<br />
An abbreviation of _Most Recently Used_ which opens a new window with buffers
you have opened recently.

- `nerdcommenter`<br />
Adds shortcuts to comment within buffers easily.

- `onedark`<br />
A beautiful colorscheme.

- `phpactor`<br />
A wicked fast, performant and improved alternative `omnifunc` completion for PHP.

Vim will freeze for roughly 5 seconds with the default omnifunc
(`omnifunc=phpcomplete#CompletePHP`) when it has to read out a `tags` file that
contains 10K or maybe even 100k+ lines of tags and provide some suggestions for
the user. Fortunately PHPActor handles this very well and quickly.

- `tabular`<br />
Align text easily.

- `ultisnips`<br />
- `vim-snippets` <br />
These two will provide a lot of useful snippets and it allows custom
user-defined snippets as well.


- `vim-closetag`<br />
Close HTML tags automatically.

- `vim-fugitive`<br />
A git wrapper within Vim.

- `vim-gitgutter`<br />
Shows a git diff in the gutter (sign column) and stages/undoes hunks.

- `vim-gutentags`<br />
Automatic and efficient tag generating made super easy.

- `vim-multiple-cursors`<br />
Easily modify text using multiple cursors.

- `vim-pasta`<br />
Re-indent code automatically when pasting.

- `vim-polyglot`<br />
A solid syntax language pack.

- `vim-prettier`<br />
A vim wrapper for the command-line tool `prettier`.

- `vim-surround`<br />
Easily surround text or change surrounding around text.

- `vim-template`<br />
Create templates for certain filetypes that will be set once you open a new
buffer of that filetype.


# License

MIT.
