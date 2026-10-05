# Understanding Common Lisp

A short book introducing Common Lisp to working programmers, by
[Dave Cooper](https://davecooper.name).

Franz Inc. published the first edition in 2003 as *Basic Lisp
Techniques* ([the 2003 edition](https://franz.com/resources/educational_resources/cooper.book.pdf)),
and has distributed it as a free PDF ever since.  This 2026 edition
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

## Contributing

Corrections, updates and improvements are welcome as pull requests;
see [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Copyright © 2003, 2026 Franz Inc. and Dave Cooper.

The text of this book is licensed under the Creative Commons
Attribution-ShareAlike 4.0 International License
([CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)); the
full legal code is in [LICENSE](LICENSE).
