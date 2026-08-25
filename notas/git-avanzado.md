# Advanced Git - Learn Git Branching

**Via:** A
**Initial date:** 2026-08-25
**Fuente:** (https://learngitbranching.js.org/)
**Tiempo invertido:** 60 min

## What did you learned

### 026-08-25 - Intro sequence + relative refs
- A **branch is just a movable pointer to a commit**, it's not a copy of the files.
- `HEAD` is the pointer to "where I am now". Normally it points to a branch but it can point to a commit.
- **Relative refs:** `HEAD^` = one commit up.
    `HEAD~3` = 3 commits up.
    This ^ means you move upwards once.
    This ~<num> means you move upwards as many times as the number set.
- **merge** creates a new commit with 2 parents.
- **rebase** it replays a commit onto a new base, creating new commits with new hashes (LGB draws it as C3' if you rebase C3).
- `git checkout <hash>` detaches HEAD, it will point straight to a commit instead of a branch.

## How can I apply it

- Instead of commit in my repos to the main branch, create one branch per milestone.
- Rebase before merging my own feature branch, that way the history reads as a straight line.

## Dudas abiertas

-

## Enlace a la práctica

- Commit / repo:
