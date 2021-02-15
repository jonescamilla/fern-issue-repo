# How to reproduce issue

- I've added my additional fern configurations in the case that they may be causing the issue.

1. Clone init.

2. Run `nvim` and open any file. `README.md` in the repo can work.

3. Press `\f` or `<Leader>f` to toggle fern window out and visable.

4. Make your session that will provide error: `mksession openedFern.vim`.

5. Press `\f` or `<Leader>f` to toggle fern window away.

6. Make your session which won't provide an error: `mksession closedFern.vim`.

7. Close nvim to start fresh.

8. Run `nvim`

9. Run `Source openedFern.vim` - you should get an error.

10. Run `Source closedFern.vim` - you shouldn't get an error.
