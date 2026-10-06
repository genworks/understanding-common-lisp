# Understanding Common Lisp

A short book introducing Common Lisp to working programmers, by
[Dave Cooper](https://davecooper.name).

**Read it:** [understanding-common-lisp.pdf](https://davecooper.name/understanding-common-lisp.pdf),
built from this repository on every change.

Franz Inc. published the first three editions as *Basic Lisp
Techniques*, in 2000, 2003 and 2011
([Franz's PDF](https://franz.com/resources/educational_resources/cooper.book.pdf)),
and has distributed it free ever since.  This fourth edition (2026)
takes the title the book was meant to have, and is rewritten for
current practice: it is no longer tied to one implementation, the
examples are shown as SBCL prints them and run on any Common Lisp,
and the tooling is today's (Quicklisp, ASDF, SLIME and Sly, portable
libraries).  The book stays short.

## What is in it

1. Introduction: where Common Lisp came from, why its stability is
   a strength, and its model of computation
2. Operating a CL development environment: choosing and installing an
   implementation, the REPL, Emacs with SLIME or Sly and other
   editors, Quicklisp and ASDF, scripts and executables, the debugger
   and restarts, and working with an AI agent in a live image
3. The CL language: syntax and evaluation, lists, control of
   execution, functions as objects, streams and strings, hash tables,
   arrays, structures, CLOS, macros, conditions, packages, and common
   stumbling blocks
4. Interfaces: the operating system, foreign functions, threads,
   sockets, JSON, databases, web serving, embedded languages
5. Where to go next: reference, books, libraries and community

## Building the PDF

You need `pdflatex` and `makeindex` from a TeX Live installation with
the standard LaTeX packages (on Debian or Ubuntu,
`texlive-latex-recommended`).  Then:

    make            # main.pdf, with the index (three LaTeX passes)
    make pdf        # one quick pass, no index
    make clean      # remove the LaTeX by-products, keep the PDF
    make help       # the other targets

Or, with Docker and nothing else installed:

    docker run --rm -v "$PWD":/book -w /book texlive/texlive:latest-small make

The same build runs in CI (`.gitlab-ci.yml`) on every push to
`master`, and its PDF is what the link above serves.

## Copyright

Copyright © 2000, 2003, 2011, 2026 Franz Inc. and Dave Cooper.
All rights reserved.
