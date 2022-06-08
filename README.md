Some scripts for "second brain"-type note-taking and note-linking with [`fzf`](https://github.com/junegunn/fzf).

In tools like Roam Research and nvALT, a link to another note is represented by **[[double brackets]]**. These tools use autocomplete to make it easier to write one note that references another.  However, as an nvALT user, I often find this way of referencing other notes too cognitively-taxing as well as limiting.  Even with autocomplete, I usually struggle to conjure the name of the note to which I want to link.  Also, autocomplete is not designed to allow me to browse a collection of notes in order to find two (or more) notes I might want to link.  

Here I use `fzf` to make it *easier to create links*. With `fzf`'s preview window I can search through my notes and select *multiple* ones to link. After selecting the notes, a dialogue presents several options, including 1) linking each note to each other note and 2) "constellating"---linking from one of the selected notes (or a new note) to all the other selected ones. Bi-directional double-bracket links are then automatically appended to the relevant files. 

---

Requirements:
- `fzf`
- [optional] `goyo.vim` (to make editing text files in Vim more pleasant)

---

The main script in this repo is `noter.sh`. It searches for notes---`.txt` files--- in its directory, feeds them to `fzf`, and handles the dialogue.  `selector1.sh` and `selector2` process the notes for `fzf` in different ways, piping each note's filename and content through various \*nix utilities (`tr`, `find`, `grep`, `sed`, etc.).  `noter.sh` uses the first one by default. `newnote.sh` is a very simple script for creating a new note, making sure that it ends in `.txt`; you can also add a new note from within `noter.sh` by selecting the special file `nn.txt`. `deleter.sh` allows for deleting a note; you can also delete files from within `noter.sh` by selecting the special file `del^.txt` *and* one or more notes to be deleted.  
