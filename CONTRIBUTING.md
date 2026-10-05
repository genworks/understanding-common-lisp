# Contributing to Understanding Common Lisp

Pull requests are welcome, and each one will be read and considered.
Not every change will be taken: the book means to stay short and
introductory, so a change that makes it longer has to make it better
for a newcomer too.

## What helps most

- **Corrections**: typos, wrong statements, code examples that do not
  run, broken links.
- **Updates** where the Common Lisp world has moved on: installing an
  implementation, Quicklisp and ASDF, Emacs with SLIME or SLY, and
  references to software or sites that no longer exist.
- **Clearer explanations** of something a first-time reader trips on.
- **Tested examples**: if you add or change code, run it, and say in
  the pull request which implementation and version you ran it on
  (SBCL, Clozure CL, Allegro CL, LispWorks, ECL, ...).

Found a problem you do not want to fix yourself?  Open an issue
describing it, with the chapter and section.

## How to send a change

1. Fork the repository on GitHub and make a branch for your change.
2. Edit the `.tex` source of the chapter concerned (`chapter1.tex` to
   `chapter5.tex`; `main.tex` holds the front matter).
3. Build with `make` (see the README) and read your change in the
   PDF.  The build should finish without new errors or warnings.
4. Open a pull request saying what you changed and why.  Keep one
   topic to a pull request, so each can be taken or left on its own.

Please:

- write in the book's plain, direct voice, and put code in the same
  environments the surrounding text uses;
- leave paragraphs you are not changing as they are (no reflowing),
  so the diff shows only your change;
- run every code example you add or change, and paste what your Lisp
  actually printed;
- commit no generated files (the PDF, `.aux`, `.idx` and the rest are
  ignored by `.gitignore`).

## How changes land

The GitHub repository is a mirror of the book's primary repository.
An accepted pull request is applied there, with you kept as the
author of your commits, and comes back to GitHub through the mirror;
the pull request is then closed with a pointer to the commit.

## License of contributions

The book is licensed under CC BY-SA 4.0 (see LICENSE).  By sending a
pull request you confirm that you have the right to contribute it,
and you license your contribution under the same terms.
