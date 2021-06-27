Some scripts for "second brain"\*-type note-taking and note-linking with `fzf`.

In tools like Roam Research and nvALT, a link to another note is represented by [[double brackets]]. These tools use autocomplete to make it easier to write one note that references another.  However, as an nvAlt user, I found this way of referencing other notes too cognitively-taxing as well as limiting.  Even with autocomplete, I usually struggle to conjure the name of the note to which I want to link.  Also, autocomplete is not designed to allow me to browse a collection of notes in order to find two (or more) notes I might want to link.  

Here I use `fzf` to make it *easier to create links*. With `fzf`'s preview window I can search through my notes and select *multiple* ones to link (using tab). After selecting the notes, a dialogue presents several options, including 1) linking all notes and 2) "constellating," linking all other notes selected to one particular note (or a new note). Bi-directional double-bracket links are then automatically appended to the relevant files. 

The bash script `noter.sh` searches for notes in its current directory.  `selector1.sh` and `selector2` process the notes for `fzf` in different ways; `noter.sh` uses the first one by default. `newnote.sh` is a very simple script for creating a new note, making sure that it ends in `.txt`.


***

\*: A dubious term. 
